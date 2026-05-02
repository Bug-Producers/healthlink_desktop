import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import '../../view_model/ratings_view_model.dart';
import '../../../../core/utils/error_handler.dart';

/// [RatingsHeaderWidget] provides the navigational context and utility actions 
/// for the Ratings & Feedback screen.
///
/// It features a responsive layout that adapts to different screen widths, 
/// providing quick access to feedback export utilities.
class RatingsHeaderWidget extends ConsumerWidget {
  /// Constructs a [RatingsHeaderWidget].
  /// 
  /// @param key The widget key.
  const RatingsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;
        
        if (isDesktop) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ratings & Feedback",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Monitor patient satisfaction and clinical feedback.",
                    style: TextStyle(
                      color: Color(0XFF5a6362),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: () => _exportToExcel(context, ref),
                icon: const Icon(Icons.download_outlined, size: 20, color: Colors.black),
                label: const Text('Export Report', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Color(0xFFE8ECEF)),
                  ),
                ),
              ),
            ],
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ratings & Feedback",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Monitor patient satisfaction and clinical feedback.",
                style: TextStyle(
                  color: Color(0XFF5a6362),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => _exportToExcel(context, ref),
                icon: const Icon(Icons.download_outlined, size: 20, color: Colors.black),
                label: const Text('Export Report', style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Color(0xFFE8ECEF)),
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }

  Future<void> _exportToExcel(BuildContext context, WidgetRef ref) async {
    try {
      final ratingsData = ref.read(ratingsViewModelProvider).asData?.value;
      if (ratingsData == null || ratingsData.ratings == null || ratingsData.ratings!.isEmpty) {
        ErrorHandler.showWarning(context, 'No ratings to export.');
        return;
      }

      var excel = Excel.createExcel();
      Sheet sheetObject = excel['Ratings'];
      excel.delete('Sheet1'); // Remove default sheet

      // Add Headers
      sheetObject.appendRow([
        TextCellValue('Patient Name'),
        TextCellValue('Stars'),
        TextCellValue('Comment'),
        TextCellValue('Date'),
      ]);

      // Add Data
      for (var rating in ratingsData.ratings!) {
        sheetObject.appendRow([
          TextCellValue(rating.patientName ?? 'Anonymous'),
          IntCellValue(rating.stars),
          TextCellValue(rating.comment ?? ''),
          TextCellValue(rating.date ?? ''),
        ]);
      }

      final bytes = excel.encode();
      if (bytes == null) throw Exception('Failed to encode Excel file.');

      String? outputFile = await FilePicker.platform.saveFile(
        dialogTitle: 'Save Ratings Report',
        fileName: 'ratings_report_${DateTime.now().millisecondsSinceEpoch}.xlsx',
        type: FileType.custom,
        allowedExtensions: ['xlsx'],
      );

      if (outputFile != null) {
        final file = File(outputFile);
        await file.writeAsBytes(bytes);
        if (context.mounted) {
          ErrorHandler.showSuccess(context, 'Report exported successfully to $outputFile');
        }
      }
    } catch (e) {
      if (context.mounted) {
        ErrorHandler.showError(context, 'Failed to export report: $e');
      }
    }
  }
}
