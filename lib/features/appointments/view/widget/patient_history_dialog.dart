import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/patient_repository.dart';
import '../../../../core/utils/error_handler.dart';
import 'add_report_dialog.dart';

/// [PatientHistoryDialog] provides an overlay to browse a patient's full medical 
/// record history.
///
/// Records are displayed in reverse-chronological order (LIFO). The dialog 
/// also provides an entry point for doctors to append new diagnostic reports 
/// to the patient's file.
class PatientHistoryDialog extends ConsumerStatefulWidget {
  /// The UID of the patient whose history is being viewed.
  final String patientId;
  
  /// The display name of the patient.
  final String patientName;

  /// Constructs a [PatientHistoryDialog].
  /// 
  /// @param patientId The patient UID.
  /// @param patientName The patient's name.
  const PatientHistoryDialog({
    super.key,
    required this.patientId,
    required this.patientName,
  });

  @override
  ConsumerState<PatientHistoryDialog> createState() => _PatientHistoryDialogState();
}

class _PatientHistoryDialogState extends ConsumerState<PatientHistoryDialog> {
  List<PatientHistory>? _history;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadHistory();
  }

  /// Synchronizes the local history state with the backend data.
  /// 
  /// @return A [Future] that completes when the data is loaded or an error occurs.
  Future<void> _loadHistory() async {
    setState(() { _isLoading = true; _error = null; });
    try {
      final repo = ref.read(patientRepositoryProvider);
      final history = await repo.getPatientHistory(widget.patientId);
      if (mounted) setState(() { _history = history; _isLoading = false; });
    } catch (e) {
      if (mounted) setState(() { _error = ErrorHandler.getMessage(e); _isLoading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      backgroundColor: Colors.white,
      child: Container(
        width: 560,
        constraints: const BoxConstraints(maxHeight: 600),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Medical History",
                        style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.patientName,
                        style: const TextStyle(color: Color(0XFF5a6362), fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: () async {
                        final result = await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AddReportDialog(
                            patientId: widget.patientId,
                            patientName: widget.patientName,
                          ),
                        );
                        if (result == true) _loadHistory();
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: const Text('Add Report', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 13)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF006D60),
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close, color: Color(0xFF5a6362)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            const Divider(height: 1, color: Color(0xFFE8ECEF)),
            const SizedBox(height: 16),
            if (_isLoading)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(child: CircularProgressIndicator(color: Color(0xFF006D60))),
              )
            else if (_error != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48),
                child: Center(
                  child: Column(
                    children: [
                      const Icon(Icons.error_outline, color: Color(0xFFD32F2F), size: 36),
                      const SizedBox(height: 12),
                      Text(_error!, style: const TextStyle(color: Color(0xFF5a6362), fontSize: 14), textAlign: TextAlign.center),
                      const SizedBox(height: 16),
                      TextButton(onPressed: _loadHistory, child: const Text('Retry')),
                    ],
                  ),
                ),
              )
            else if (_history == null || _history!.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.folder_open_outlined, color: Color(0xFFa0a7a6), size: 48),
                      SizedBox(height: 12),
                      Text('No medical records found', style: TextStyle(color: Color(0xFF5a6362), fontSize: 15)),
                    ],
                  ),
                ),
              )
            else
              Flexible(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: _history!.length,
                  separatorBuilder: (_, __) => const Divider(height: 1, color: Color(0xFFF1F4F5)),
                  itemBuilder: (context, index) {
                    final record = _history![index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 40, height: 40,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0F2F1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.description_outlined, color: Color(0xFF006D60), size: 20),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (record.date != null)
                                  Text(
                                    record.date!,
                                    style: const TextStyle(color: Color(0xFF5a6362), fontSize: 12, fontWeight: FontWeight.w600),
                                  ),
                                const SizedBox(height: 6),
                                Text(
                                  record.report,
                                  style: const TextStyle(color: Color(0xFF1A1A2E), fontSize: 14, fontWeight: FontWeight.w500, height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
