import '../../api/api_client.dart';
import '../../api/generated/export.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/error/api_error.dart';
import '../../core/providers.dart';
import '../../l10n/l10n.dart';

enum EnrollStep { form, submitting, done, error }

class EnrollState {
  const EnrollState({
    this.step = EnrollStep.form,
    this.result,
    this.errorMessage,
  });

  final EnrollStep step;
  final EnrollCustomerResponse? result;
  final String? errorMessage;

  EnrollState copyWith({
    EnrollStep? step,
    EnrollCustomerResponse? result,
    String? errorMessage,
    bool clearError = false,
  }) => EnrollState(
    step: step ?? this.step,
    result: result ?? this.result,
    errorMessage: clearError ? null : (errorMessage ?? this.errorMessage),
  );
}

/// Drives customer enrollment (spec §5.5). On success it exposes the new
/// customer id so the agent can immediately upload KYC documents.
class EnrollController extends Notifier<EnrollState> {
  @override
  EnrollState build() => const EnrollState();
  ApiClient get _api => ref.read(apiClientProvider);

  Future<void> submit(EnrollCustomerRequest form) async {
    state = state.copyWith(step: EnrollStep.submitting, clearError: true);
    try {
      final answer = await _api.send(
        (api) => api.agentEnrollmentController.enroll(body: form),
      );
      final res = requireData(answer.data);
      if (!ref.mounted) return;
      state = state.copyWith(step: EnrollStep.done, result: res);
    } on ApiError catch (e) {
      if (!ref.mounted) return;
      state = state.copyWith(
        step: EnrollStep.form,
        errorMessage: apiErrorMessage(e),
      );
    } catch (_) {
      if (!ref.mounted) return;
      state = state.copyWith(
        step: EnrollStep.form,
        errorMessage: l10n.commonErreurSurvenue,
      );
    }
  }
}

final enrollControllerProvider =
    NotifierProvider.autoDispose<EnrollController, EnrollState>(
      EnrollController.new,
    );
