import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/auth_view_model.dart';
import '../../../../core/utils/error_handler.dart';

/// The forgot password form widget with Firebase password reset functionality.
///
/// Provides a two-state interface:
/// 1. Email input — the user enters their registered email address.
/// 2. Success confirmation — a visual confirmation that the reset email was sent,
///    with instructions on next steps.
class ForgotPasswordFormWidget extends ConsumerStatefulWidget {
  /// Callback invoked when the user presses "Back to Sign In".
  final VoidCallback onBackToLogin;

  /// Constructs a [ForgotPasswordFormWidget].
  ///
  /// @param key The widget key.
  /// @param onBackToLogin Callback to navigate back to the login screen.
  const ForgotPasswordFormWidget({
    super.key,
    required this.onBackToLogin,
  });

  @override
  ConsumerState<ForgotPasswordFormWidget> createState() => _ForgotPasswordFormWidgetState();
}

class _ForgotPasswordFormWidgetState extends ConsumerState<ForgotPasswordFormWidget>
    with SingleTickerProviderStateMixin {
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _emailSent = false;

  late AnimationController _animController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnimation = CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOut,
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animController,
      curve: Curves.easeOutCubic,
    ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 400),
      switchInCurve: Curves.easeOut,
      switchOutCurve: Curves.easeIn,
      child: _emailSent ? _buildSuccessView() : _buildEmailInputView(),
    );
  }

  /// Builds the email input form (initial state).
  Widget _buildEmailInputView() {
    return Column(
      key: const ValueKey('email_input'),
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header icon
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F5),
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Icon(
            Icons.lock_outline,
            color: Color(0xFF006D60),
            size: 32,
          ),
        ),
        const SizedBox(height: 24),

        // Title
        const Text(
          "Reset Password",
          style: TextStyle(
            color: Colors.black,
            fontSize: 28,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Enter your registered email and we'll send you\na link to reset your password.",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0XFF5a6362),
            fontSize: 14,
            fontWeight: FontWeight.w500,
            height: 1.6,
          ),
        ),

        const SizedBox(height: 40),

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

        const SizedBox(height: 32),

        // Send Reset Link button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handlePasswordReset,
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
                    'Send Reset Link',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.send_outlined, size: 18),
                ],
              ],
            ),
          ),
        ),

        const SizedBox(height: 24),

        // Back to login
        TextButton.icon(
          onPressed: widget.onBackToLogin,
          icon: const Icon(Icons.arrow_back, size: 16),
          label: const Text(
            "Back to Sign In",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
          ),
          style: TextButton.styleFrom(foregroundColor: const Color(0xFF006D60)),
        ),
      ],
    );
  }

  /// Builds the success confirmation view (after email is sent).
  Widget _buildSuccessView() {
    // Trigger the entrance animation
    _animController.forward(from: 0);

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          key: const ValueKey('success_view'),
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated success icon
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF006D60).withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xFF006D60),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.mark_email_read_outlined,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
            const SizedBox(height: 32),

            const Text(
              "Check Your Inbox",
              style: TextStyle(
                color: Colors.black,
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "We've sent a password reset link to",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: const Color(0XFF5a6362),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                height: 1.6,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _emailController.text.trim(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF006D60),
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 32),

            // Instructions card
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  _buildInstructionRow(
                    "1",
                    "Open the email from HealthLink",
                  ),
                  const SizedBox(height: 12),
                  _buildInstructionRow(
                    "2",
                    "Click the secure reset link",
                  ),
                  const SizedBox(height: 12),
                  _buildInstructionRow(
                    "3",
                    "Create your new password",
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Didn't receive?
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn't receive the email?",
                  style: TextStyle(
                    color: Color(0XFF5a6362),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: _isLoading ? null : _handleResend,
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFF006D60),
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    "Resend",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Back to Sign In
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.onBackToLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006D60),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  elevation: 0,
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Back to Sign In',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a single instruction row with a numbered badge.
  Widget _buildInstructionRow(String number, String text) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: const Color(0xFF006D60).withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                color: Color(0xFF006D60),
                fontSize: 13,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          text,
          style: const TextStyle(
            color: Color(0XFF5a6362),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  /// Handles sending the password reset email via Firebase.
  Future<void> _handlePasswordReset() async {
    final email = _emailController.text.trim();

    if (email.isEmpty) {
      ErrorHandler.showWarning(context, 'Please enter your email address.');
      return;
    }

    // Basic email format validation
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(email)) {
      ErrorHandler.showWarning(context, 'Please enter a valid email address.');
      return;
    }

    setState(() => _isLoading = true);
    try {
      await ref.read(authViewModelProvider.notifier).resetPassword(email);
      if (mounted) {
        setState(() {
          _emailSent = true;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        ErrorHandler.showError(context, e);
        setState(() => _isLoading = false);
      }
    }
  }

  /// Handles resending the password reset email.
  Future<void> _handleResend() async {
    setState(() => _isLoading = true);
    try {
      await ref.read(authViewModelProvider.notifier)
          .resetPassword(_emailController.text.trim());
      if (mounted) {
        ErrorHandler.showSuccess(context, 'Reset link resent successfully.');
        setState(() => _isLoading = false);
      }
    } catch (e) {
      if (mounted) {
        ErrorHandler.showError(context, e);
        setState(() => _isLoading = false);
      }
    }
  }
}
