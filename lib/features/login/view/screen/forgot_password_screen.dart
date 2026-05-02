import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/forgot_password_form_widget.dart';

/// [ForgotPasswordScreen] provides the password recovery entry point.
///
/// It mirrors the [LoginScreen] split-pane layout on desktop with a 
/// professional clinical visual on the left and the reset form on the right.
class ForgotPasswordScreen extends StatelessWidget {
  /// Constructs a [ForgotPasswordScreen].
  /// 
  /// @param key The widget key.
  const ForgotPasswordScreen({super.key});

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
                        child: const Icon(Icons.lock_reset, color: Color(0XFF0d9488), size: 32),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        "Account\nRecovery",
                        style: GoogleFonts.inter(
                          fontSize: 48,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          height: 1.1,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        "Don't worry — it happens to the best of us. We'll send a secure link to reset your credentials.",
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
          Expanded(
            flex: 1,
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(40),
                child: ForgotPasswordFormWidget(
                  onBackToLogin: () => Navigator.of(context).pop(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
