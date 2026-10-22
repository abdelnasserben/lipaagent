import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // French locale data for intl date formatting.
  await initializeDateFormatting('fr_FR');

  // Draw behind the real system bars and color them to match the app, so the
  // device's own status bar blends with our warm background (no faux bar).
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark, // dark icons on light bg
      statusBarBrightness: Brightness.light, // iOS: light bg → dark icons
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    ProviderScope(
      // No automatic retry of failed requests: the agent decides (boring and
      // predictable; a retried call could surprise them).
      retry: (retryCount, error) => null,
      child: const LipaAgentApp(),
    ),
  );
}
