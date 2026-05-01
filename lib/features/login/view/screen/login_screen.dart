import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/login_form_widget.dart';

/// [LoginScreen] provides the entry point for existing doctor accounts.
///
/// It features a split-pane layout on desktop with a professional clinical 
/// visual on the left and the authentication form on the right.
class LoginScreen extends StatelessWidget {
  /// Constructs a [LoginScreen].
  /// 
  /// @param key The widget key.
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Visual/Marketing Side
          Expanded(
            flex: 1,
            child: Container(
              color: const Color(0XFFf7f9fb),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(60.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: const Color(0XFF0d9488).withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.local_hospital, color: Color(0XFF0d9488), size: 32),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "HealthLink\nClinical Atelier",
                        style: GoogleFonts.inter(
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Enterprise-grade management for the modern physician. Secure, real-time, and patient-centric.",
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          color: const Color(0XFF5a6362),
                          height: 1.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
          // Form Side
          const Expanded(
            flex: 1,
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(40),
                child: LoginFormWidget(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
