import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:window_manager/window_manager.dart';

import 'features/login/view/screen/login_screen.dart';

/// The main entry point for the HealthLink desktop application.
///
/// Initializes the Flutter bindings and configures the desktop window
/// properties (size, centering, title) using the [window_manager] package.
/// Once the window is ready, it is displayed and focused.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

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

  runApp(const MyApp());
}

/// The root application widget.
///
/// Sets up the [MaterialApp] with the global theme configuration and responsive
/// layout wrapper using [ResponsiveBreakpoints].
/// 
/// @param key The widget key.
class MyApp extends StatelessWidget {
  /// Constructs the [MyApp] widget.
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