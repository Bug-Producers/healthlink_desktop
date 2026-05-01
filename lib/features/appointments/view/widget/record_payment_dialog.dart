import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/models.dart';
import '../../../financials/view_model/financials_view_model.dart';
import '../../../../core/utils/error_handler.dart';
import 'add_report_dialog.dart';

/// [RecordPaymentDialog] manages the manual logging of clinical fees paid in 
/// person (e.g., cash transactions).
///
/// It pre-populates contextual information from the selected appointment 
/// and provides a post-transaction workflow that encourages the doctor 
/// to immediately append a medical report to the patient's record.
class RecordPaymentDialog extends ConsumerStatefulWidget {
  /// The UID of the patient making the payment.
  final String patientId;
  
  /// The specific appointment UID associated with this transaction.
  final String appointmentId;
  
  /// The display name of the patient.
  final String patientName;

  /// Constructs a [RecordPaymentDialog].
  /// 
  /// @param patientId The patient UID.
  /// @param appointmentId The appointment UID.
  /// @param patientName The patient's name.
  const RecordPaymentDialog({
    super.key,
    required this.patientId,
    required this.appointmentId,
    required this.patientName,
  });

  @override
  ConsumerState<RecordPaymentDialog> createState() => _RecordPaymentDialogState();
}

class _RecordPaymentDialogState extends ConsumerState<RecordPaymentDialog> {
  final _amountController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

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
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 12),
            Text(
              "Logging payment for ${widget.patientName}",
              style: const TextStyle(
                color: Color(0XFF5a6362),
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F4F5),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.event_outlined, size: 16, color: Color(0xFF5a6362)),
                  const SizedBox(width: 8),
                  Text(
                    'Appointment: ${widget.appointmentId.length > 12 ? '${widget.appointmentId.substring(0, 12)}...' : widget.appointmentId}',
                    style: const TextStyle(color: Color(0xFF5a6362), fontSize: 12, fontWeight: FontWeight.w600),
                  ),
                ],
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
              controller: _amountController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
              style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isLoading ? null : _handleRecordPayment,
                icon: _isLoading
                    ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Icon(Icons.receipt_long_outlined, size: 20),
                label: Text(
                  _isLoading ? 'Recording...' : 'Record Payment',
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                ),
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

  /// Validates and submits the payment details to the financial hub.
  /// 
  /// @return A [Future] completing after the transaction is recorded.
  Future<void> _handleRecordPayment() async {
    final amountStr = _amountController.text.trim();
    final amount = double.tryParse(amountStr);
    if (amount == null || amount <= 0) {
      ErrorHandler.showWarning(context, 'Please enter a valid payment amount.');
      return;
    }

    setState(() => _isLoading = true);
    try {
      final payment = Payment(
        patientId: widget.patientId,
        appointmentId: widget.appointmentId,
        amount: amount,
      );
      await ref.read(financialsViewModelProvider.notifier).recordPayment(payment);

      if (mounted) {
        ErrorHandler.showSuccess(context, 'Payment of \$${amount.toStringAsFixed(2)} recorded successfully.');
        Navigator.of(context).pop();

        // Offer to write a medical report after payment
        showDialog(
          context: context,
          builder: (ctx) => AddReportDialog(
            patientId: widget.patientId,
            patientName: widget.patientName,
          ),
        );
      }
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
