import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthlink_desktop/features/navigation/view/screen/navigation_screen.dart';
import 'package:healthlink_desktop/features/signup/view/screen/signup_screen.dart';
import '../../../../core/repositories/doctor_repository.dart';
import '../../../../core/utils/error_handler.dart';
import '../../view_model/auth_view_model.dart';
import '../screen/forgot_password_screen.dart';

/// The login form widget with Firebase authentication and doctor verification.
///
/// After Firebase login, calls POST /api/is-it-doctor to confirm the
/// authenticated user is a registered doctor before allowing access.
class LoginFormWidget extends ConsumerStatefulWidget {
  const LoginFormWidget({super.key});

  @override
  ConsumerState<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends ConsumerState<LoginFormWidget> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email field
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
              controller: _emailController,
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
        
        // Password field
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
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const ForgotPasswordScreen()),
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: const Color(0xFF006D60),
                  ),
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline, color: Color(0XFFa5b0b5), size: 20),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    color: const Color(0XFFa5b0b5),
                    size: 20,
                  ),
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                ),
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
        
        // Sign In button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF006D60),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              elevation: 0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_isLoading)
                  const SizedBox(
                    height: 20, width: 20,
                    child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                  )
                else ...[
                  const Text(
                    'Sign In',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 18),
                ],
              ],
            ),
          ),
        ),
        
        const SizedBox(height: 24),
        
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const SignupScreen()),
            );
          },
          style: TextButton.styleFrom(foregroundColor: const Color(0xFF006D60)),
          child: const Text(
            "Create a new account",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  /// Handles the login flow: validate → Firebase login → doctor verification → navigate.
  Future<void> _handleLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ErrorHandler.showWarning(context, 'Please enter your email and password.');
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Step 1: Firebase authentication
      await ref.read(authViewModelProvider.notifier).login(email, password);

      // Step 2: Verify the user is a registered doctor
      final doctorRepo = ref.read(doctorRepositoryProvider);
      final user = ref.read(authViewModelProvider).value;
      if (user != null) {
        final isDoc = await doctorRepo.isDoctor(user.uid);
        if (!isDoc) {
          // Sign out fully if not a doctor — show a generic credential error
          // to avoid revealing account type information.
          await ref.read(authViewModelProvider.notifier).logout();
          if (mounted) {
            ErrorHandler.showError(context, 'Incorrect email or password. Please try again.');
          }
          return;
        }
      }

      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavigationScreen()),
        );
      }
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
