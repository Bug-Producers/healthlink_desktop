import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'features/navigation/view/screen/navigation_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 450, name: MOBILE),
          const Breakpoint(start: 451, end: 850, name: TABLET),
          const Breakpoint(start: 851, end: 1920, name: DESKTOP),
          const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0XFF0d9488),
      ),
      home: const NavigationScreen(),
    );
  }
}