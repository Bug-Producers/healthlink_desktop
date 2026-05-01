import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:window_manager/window_manager.dart';

import 'features/login/view/screen/login_screen.dart';

/// The main entry point for the HealthLink desktop application.
///
/// Initializes the Flutter bindings, environment variables, Firebase, 
/// and configures the desktop window properties.
/// 
/// @return A [Future] that completes when the application has started.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY'] ?? '',
      appId: dotenv.env['FIREBASE_APP_ID'] ?? '',
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID'] ?? '',
      projectId: dotenv.env['FIREBASE_PROJECT_ID'] ?? '',
      authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN'],
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'],
      measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID'],
    ),
  );

  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(1200, 800),
    minimumSize: Size(900, 600),
    center: true,
    title: "HealthLink Clinical Atelier",
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

/// The root application widget.
///
/// Sets up the [MaterialApp] with the global theme configuration and responsive
/// layout wrapper using [ResponsiveBreakpoints].
class MyApp extends StatelessWidget {
  /// Constructs the [MyApp] widget.
  /// 
  /// @param key The widget key.
  const MyApp({super.key});

  /// Builds the [MaterialApp] and configures responsive breakpoints.
  ///
  /// This wrapper ensures that child screens can adapt to MOBILE, TABLET,
  /// DESKTOP, and 4K breakpoints.
  ///
  /// @param context The build context.
  /// @return A configured [MaterialApp] widget.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      builder: (context, child) {
        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 850, name: TABLET),
            Breakpoint(start: 851, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
      },

      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0XFF0d9488),
      ),

      home: const LoginScreen(),
    );
  }
}