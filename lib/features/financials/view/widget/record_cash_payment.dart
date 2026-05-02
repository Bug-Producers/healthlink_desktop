import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/models.dart';
import '../../view_model/financials_view_model.dart';
import '../../../../core/utils/error_handler.dart';

/// [RecordCashPaymentWidget] provides an inline form on the Financials page for 
/// processing manual medical fee entries.
///
/// This is used when patients pay directly at the clinic, bypassing the 
/// automated booking platform's payment gateway.
class RecordCashPaymentWidget extends ConsumerStatefulWidget {
  /// Constructs a [RecordCashPaymentWidget].
  /// 
  /// @param key The widget key.
  const RecordCashPaymentWidget({super.key});

  @override
  ConsumerState<RecordCashPaymentWidget> createState() => _RecordCashPaymentWidgetState();
}

class _RecordCashPaymentWidgetState extends ConsumerState<RecordCashPaymentWidget> {
  final _appointmentIdController = TextEditingController();
  final _amountController = TextEditingController();
  final _patientIdController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _appointmentIdController.dispose();
    _amountController.dispose();
    _patientIdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Record Cash Payment",
            style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 12),
          const Text(
            "Manually log a direct patient\npayment outside of automated\nbilling.",
            style: TextStyle(color: Color(0XFF5a6362), fontSize: 14, fontWeight: FontWeight.w500, height: 1.4),
          ),
          const SizedBox(height: 32),
          
          const Text("PATIENT ID", style: TextStyle(color: Color(0XFF5a6362), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _patientIdController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.person_outline, color: Color(0XFF5a6362), size: 20),
              hintText: "Patient UID", hintStyle: const TextStyle(color: Color(0XFFa5b0b5)),
              filled: true, fillColor: const Color(0xFFF1F4F5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          
          const Text("APPOINTMENT ID", style: TextStyle(color: Color(0XFF5a6362), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
          const SizedBox(height: 8),
          TextFormField(
            controller: _appointmentIdController,
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.event_outlined, color: Color(0XFF5a6362), size: 20),
              hintText: "e.g. APT-102", hintStyle: const TextStyle(color: Color(0XFFa5b0b5)),
              filled: true, fillColor: const Color(0xFFF1F4F5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 24),
          
          const Text("AMOUNT", style: TextStyle(color: Color(0XFF5a6362), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2)),
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
              hintText: "0.00", hintStyle: const TextStyle(color: Color(0XFFa5b0b5)),
              filled: true, fillColor: const Color(0xFFF1F4F5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 48),
          
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _isLoading ? null : _handleRecord,
              icon: _isLoading
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Icon(Icons.receipt_long_outlined, size: 20),
              label: Text(_isLoading ? 'Recording...' : 'Record Payment', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D60),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Handles the manual submission of the cash payment record.
  /// 
  /// @return A [Future] that completes when the record has been persisted.
  Future<void> _handleRecord() async {
    final patientId = _patientIdController.text.trim();
    final appointmentId = _appointmentIdController.text.trim();
    final amount = double.tryParse(_amountController.text.trim());

    if (patientId.isEmpty || appointmentId.isEmpty) {
      ErrorHandler.showWarning(context, 'Please fill in all required fields.');
      return;
    }
    if (amount == null || amount <= 0) {
      ErrorHandler.showWarning(context, 'Please enter a valid payment amount.');
      return;
    }

    setState(() => _isLoading = true);
    try {
      final payment = Payment(
        patientId: patientId,
        appointmentId: appointmentId,
        amount: amount,
        date: DateTime.now().toIso8601String().split('T')[0], // YYYY-MM-DD
      );
      await ref.read(financialsViewModelProvider.notifier).recordPayment(payment);
      if (mounted) {
        ErrorHandler.showSuccess(context, 'Payment of \$${amount.toStringAsFixed(2)} recorded.');
        _amountController.clear();
        _appointmentIdController.clear();
        _patientIdController.clear();
      }
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
