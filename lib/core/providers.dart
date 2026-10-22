import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../api/api_client.dart';
import 'auth/token_store.dart';
import 'config/app_environment.dart';
import 'scan/scanner.dart';

/// Build-time configuration (`--dart-define=ENV=local|prod`).
/// Overridable in tests.
final appConfigProvider = Provider<AppConfig>((ref) {
  return AppConfig.fromEnvironment();
});

final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  // Android: encrypted with a key held by the Android Keystore (default).
  return const FlutterSecureStorage();
});

final tokenStoreProvider = Provider<TokenStore>((ref) {
  return TokenStore(ref.watch(secureStorageProvider));
});

/// The typed API client: `ref.read(apiClientProvider).send((api) => …)`.
final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    config: ref.watch(appConfigProvider),
    tokenStore: ref.watch(tokenStoreProvider),
  );
});

/// Hardware-scan seam (see core/scan/scanner.dart). Uses real NFC where the
/// device has a reader, and falls back to manual UID entry where it doesn't.
final cardScannerProvider = Provider<CardScanner>((ref) {
  return const NfcCardScanner();
});
