import 'dart:typed_data';

import 'package:dio/dio.dart' show MultipartFile;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../api/api_client.dart';
import '../../api/generated/export.dart';
import '../../core/providers.dart';
import '../../core/utils/validators.dart';

/// A customer's KYC documents (metadata only), read when the screen opens.
final kycDocumentsProvider = FutureProvider.autoDispose
    .family<List<KycDocumentResponse>, String>((ref, customerId) async {
      final res = await ref
          .watch(apiClientProvider)
          .send(
            (api) =>
                api.agentKycController.listDocuments(customerId: customerId),
          );
      return res.data ?? const [];
    });

class KycCustomerState {
  const KycCustomerState({this.busy = false, this.error, this.customer});

  final bool busy;
  final Object? error;
  final CustomerLookupResponse? customer;
}

/// Finds the customer whose KYC file the agent completes.
class KycCustomerController extends Notifier<KycCustomerState> {
  @override
  KycCustomerState build() => const KycCustomerState();

  Future<void> lookup(String phone) async {
    state = const KycCustomerState(busy: true);
    try {
      final answer = await ref
          .read(apiClientProvider)
          .send(
            (api) => api.agentTransactionController.lookupCustomer(
              phoneCountryCode: '269',
              phoneNumber: PhoneValidator.digitsOf(phone),
            ),
          );
      if (!ref.mounted) return;
      state = KycCustomerState(customer: requireData(answer.data));
    } catch (e) {
      if (!ref.mounted) return;
      state = KycCustomerState(error: e);
    }
  }

  void clear() => state = const KycCustomerState();
}

final kycCustomerControllerProvider =
    NotifierProvider.autoDispose<KycCustomerController, KycCustomerState>(
      KycCustomerController.new,
    );

class KycUploadState {
  const KycUploadState({this.busy = false});
  final bool busy;
}

/// Sends one identity document (JPEG, PNG or PDF, at most 10 MB).
class KycUploadController extends Notifier<KycUploadState> {
  @override
  KycUploadState build() => const KycUploadState();

  /// Returns the failure, if any, for a message.
  Future<Object?> upload({
    required String customerId,
    required String documentType,
    required Uint8List bytes,
    required String filename,
  }) async {
    state = const KycUploadState(busy: true);
    try {
      await ref
          .read(apiClientProvider)
          .send(
            (api) => api.agentKycController.uploadDocument(
              customerId: customerId,
              documentType: documentType,
              file: MultipartFile.fromBytes(bytes, filename: filename),
            ),
          );
      if (!ref.mounted) return null;
      ref.invalidate(kycDocumentsProvider(customerId));
      state = const KycUploadState();
      return null;
    } catch (e) {
      if (ref.mounted) state = const KycUploadState();
      return e;
    }
  }
}

final kycUploadControllerProvider =
    NotifierProvider.autoDispose<KycUploadController, KycUploadState>(
      KycUploadController.new,
    );
