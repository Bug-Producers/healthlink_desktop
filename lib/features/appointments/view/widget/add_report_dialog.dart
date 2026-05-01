import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/repositories/patient_repository.dart';
import '../../../../core/utils/error_handler.dart';

/// [AddReportDialog] facilitates the creation of a new medical diagnostic or 
/// prescriptive report for a specific patient.
///
/// It captures clinical notes and submits them to the patient's persistent 
/// medical history log.
class AddReportDialog extends ConsumerStatefulWidget {
  /// The UID of the patient receiving the report.
  final String patientId;
  
  /// The display name of the patient.
  final String patientName;

  /// Constructs an [AddReportDialog].
  /// 
  /// @param patientId The patient UID.
  /// @param patientName The patient's name.
  const AddReportDialog({
    super.key,
    required this.patientId,
    required this.patientName,
  });

  @override
  ConsumerState<AddReportDialog> createState() => _AddReportDialogState();
}

class _AddReportDialogState extends ConsumerState<AddReportDialog> {
  final _reportController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _reportController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        width: 500,
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2F1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.medical_information_outlined, color: Color(0xFF006D60), size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add Medical Report",
                        style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      Text(
                        "For ${widget.patientName}",
                        style: const TextStyle(color: Color(0XFF5a6362), fontSize: 14, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 28),
            const Text(
              "DIAGNOSIS / PRESCRIPTION",
              style: TextStyle(
                color: Color(0XFF5a6362),
                fontSize: 12,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _reportController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "Patient presented with... Prescribed...",
                hintStyle: const TextStyle(color: Color(0XFFa5b0b5)),
                filled: true,
                fillColor: const Color(0xFFF1F4F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.all(16),
              ),
              style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500, height: 1.5),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Color(0XFF5a6362), fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: _isLoading ? null : _handleSubmit,
                  icon: _isLoading
                      ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                      : const Icon(Icons.save_outlined, size: 18),
                  label: Text(
                    _isLoading ? 'Saving...' : 'Save Report',
                    style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF006D60),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Processes the report submission.
  /// 
  /// @return A [Future] completing after the API request finishes.
  Future<void> _handleSubmit() async {
    final report = _reportController.text.trim();
    if (report.isEmpty) {
      ErrorHandler.showWarning(context, 'Please write a report before saving.');
      return;
    }

    setState(() => _isLoading = true);
    try {
      final repo = ref.read(patientRepositoryProvider);
      await repo.addPatientReport(widget.patientId, report);
      if (mounted) {
        ErrorHandler.showSuccess(context, 'Medical report saved successfully.');
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }
}
