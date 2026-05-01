import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widget/signup_form_widget.dart';

/// [SignupScreen] is the registration gateway for new doctors.
///
/// It provides a clean, focused interface for medical professionals to 
/// establish their digital clinic presence.
class SignupScreen extends StatelessWidget {
  /// Constructs a [SignupScreen].
  /// 
  /// @param key The widget key.
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Container(
            width: 520,
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  blurRadius: 30,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Join HealthLink",
                  style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w800,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Complete your professional profile to start managing your clinical practice.",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    color: const Color(0XFF5a6362),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 32),
                const SignupFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
