import 'package:flutter/material.dart';

/// A dialog widget for recording manual cash payments.
///
/// This modal pops up when an administrator needs to log a direct patient payment
/// outside the automated billing system. It provides an amount input field and
/// an action button to submit.
///
/// @param key The widget key.
class RecordPaymentDialog extends StatelessWidget {
  /// Constructs the [RecordPaymentDialog].
  const RecordPaymentDialog({super.key});

  /// Builds the dialog layout and styling.
  ///
  /// @param context The build context.
  /// @return A styled [Dialog] containing a form.
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        width: 400,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Record Cash Payment",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Manually log a direct patient\npayment outside of automated\nbilling.",
              style: TextStyle(
                color: Color(0XFF5a6362),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "AMOUNT",
              style: TextStyle(
                color: Color(0XFF5a6362),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Text("\$", style: TextStyle(color: Color(0XFF5a6362), fontSize: 16, fontWeight: FontWeight.w600)),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                hintText: "0.00",
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
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.receipt_long_outlined, size: 20),
                label: const Text('Record Payment', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006D60),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  elevation: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
