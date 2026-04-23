import 'package:flutter/material.dart';
import 'package:healthlink_desktop/features/login/view/widget/login_header_widget.dart';
import '../widget/signup_form_widget.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            margin: const EdgeInsets.symmetric(vertical: 40),
            padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 56),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.04),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                LoginHeaderWidget(),
                SizedBox(height: 48),
                SignupFormWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
