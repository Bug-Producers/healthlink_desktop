import 'package:flutter/material.dart';
import 'package:healthlink_desktop/features/navigation/view/screen/navigation_screen.dart';
import 'package:healthlink_desktop/features/signup/view/screen/signup_screen.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "CORPORATE EMAIL",
              style: TextStyle(
                color: Color(0XFF5a6362),
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.mail_outline, color: Color(0XFFa5b0b5), size: 20),
                hintText: "dr.smith@healthlink.com",
                hintStyle: const TextStyle(color: Color(0XFFa5b0b5)),
                filled: true,
                fillColor: const Color(0xFFF1F4F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 24),
        
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "PASSWORD",
                  style: TextStyle(
                    color: Color(0XFF5a6362),
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: const Color(0xFF006D60),
                  ),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0XFFa5b0b5), size: 20),
                hintText: "••••••••",
                hintStyle: const TextStyle(color: Color(0XFFa5b0b5), letterSpacing: 4),
                filled: true,
                fillColor: const Color(0xFFF1F4F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              ),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        
        const SizedBox(height: 48),
        
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const NavigationScreen(),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF006D60),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Sign In',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
                SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: 18),
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        TextButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const SignupScreen(),
              ),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0xFF006D60),
          ),
          child: const Text(
            "Create a new account",
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
