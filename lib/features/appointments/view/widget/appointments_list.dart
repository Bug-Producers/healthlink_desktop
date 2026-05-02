import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/utils/error_handler.dart';
import '../../../../core/utils/image_helper.dart';
import '../../view_model/appointments_view_model.dart';
import '../../../financials/view_model/financials_view_model.dart';
import 'record_payment_dialog.dart';
import 'patient_history_dialog.dart';

/// [AppointmentData] is a localized UI model used to map API results to 
/// the display requirements of the [AppointmentsListWidget].
class AppointmentData {
  final String name;
  final String id;
  final String? patientId;
  final String? avatarUrl;
  final String initials;
  final String date;
  final String time;
  final String status;
  final bool isCrossedOut;
  final int statusCode;
  final bool hasPayment;

  /// Constructs [AppointmentData].
  /// 
  /// @param name The patient's full name.
  /// @param id The unique appointment identifier.
  /// @param patientId The patient's UID.
  /// @param avatarUrl Link to the patient's profile image.
  /// @param initials Fallback initials for the avatar.
  /// @param date The scheduled date string.
  /// @param time The formatted time range string.
  /// @param status The human-readable status text.
  /// @param isCrossedOut Whether the row should appear as cancelled.
  /// @param statusCode The raw status code from the API.
  AppointmentData({
    required this.name,
    required this.id,
    this.patientId,
    this.avatarUrl,
    required this.initials,
    required this.date,
    required this.time,
    required this.status,
    this.isCrossedOut = false,
    this.statusCode = 0,
    this.hasPayment = false,
  });
}

/// [AppointmentsListWidget] renders a premium, interactive data table 
/// of all clinical appointments.
///
/// It supports real-time status transitions (Upcoming -> Completed), 
/// financial recording, and seamless navigation to patient medical histories.
class AppointmentsListWidget extends ConsumerWidget {
  /// Constructs an [AppointmentsListWidget].
  /// 
  /// @param key The widget key.
  const AppointmentsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointmentsState = ref.watch(appointmentsViewModelProvider);
    final financialsState = ref.watch(financialsViewModelProvider);
    final paidAppointmentIds = financialsState.valueOrNull?.payments.map((p) => p.appointmentId).toSet() ?? {};

    return appointmentsState.when(
      loading: () => const Center(
        child: Padding(
          padding: EdgeInsets.all(48),
          child: CircularProgressIndicator(color: Color(0xFF006D60)),
        ),
      ),
      error: (err, _) => Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBEE),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.cloud_off_outlined, size: 40, color: Color(0xFFD32F2F)),
              ),
              const SizedBox(height: 20),
              Text(
                ErrorHandler.getMessage(err),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF5a6362), fontSize: 14),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                onPressed: () => ref.invalidate(appointmentsViewModelProvider),
                icon: const Icon(Icons.refresh, size: 18),
                label: const Text('Retry', style: TextStyle(fontWeight: FontWeight.w700)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006D60),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ],
          ),
        ),
      ),
      data: (appointments) {
        final List<AppointmentData> listData = appointments.map((apt) {
          String statusStr = "Upcoming";
          if (apt.status == 1) statusStr = "Completed";
          if (apt.status == 2) statusStr = "Cancelled";

          return AppointmentData(
            name: apt.patientName ?? "Unknown",
            id: apt.id,
            patientId: apt.patientId,
            avatarUrl: apt.patientImage,
            initials: (apt.patientName != null && apt.patientName!.isNotEmpty)
                ? apt.patientName![0]
                : "?",
            date: apt.date,
            time: "${apt.startTime} - ${apt.endTime}",
            status: statusStr,
            isCrossedOut: apt.status == 2,
            statusCode: apt.status,
            hasPayment: paidAppointmentIds.contains(apt.id),
          );
        }).toList();

        if (listData.isEmpty) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(48),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Icon(Icons.event_note_outlined, size: 48, color: const Color(0xFF006D60).withValues(alpha: 0.5)),
                const SizedBox(height: 16),
                const Text(
                  'No appointments yet',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF5a6362)),
                ),
              ],
            ),
          );
        }

        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(25)),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Theme(
                    data: Theme.of(context).copyWith(dividerColor: const Color(0XFFF1F4F5)),
                    child: DataTable(
                      headingRowColor: WidgetStateProperty.all(const Color(0XFFf2f4f6)),
                      horizontalMargin: 24,
                      columnSpacing: 40,
                      headingRowHeight: 56,
                      dataRowMinHeight: 72,
                      dataRowMaxHeight: 88,
                      headingTextStyle: const TextStyle(
                        color: Color(0XFF5a6362),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 1.5,
                      ),
                      columns: const [
                        DataColumn(label: Text("PATIENT")),
                        DataColumn(label: Text("DATE")),
                        DataColumn(label: Text("ASSIGNED TIME")),
                        DataColumn(label: Text("STATUS")),
                        DataColumn(label: Text("ACTIONS")),
                      ],
                      rows: listData.map((data) => _buildRow(context, ref, data)).toList(),
                    ),
                  ),
                ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  /// Constructs a single data row for the table.
  /// 
  /// @param context The build context.
  /// @param ref The widget ref.
  /// @param data The localized appointment data.
  /// @return A configured [DataRow].
  DataRow _buildRow(BuildContext context, WidgetRef ref, AppointmentData data) {
    final textStyle = TextStyle(
      color: data.isCrossedOut ? const Color(0XFF8e9998) : Colors.black,
      fontSize: 15,
      fontWeight: FontWeight.w600,
      decoration: data.isCrossedOut ? TextDecoration.lineThrough : null,
    );

    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0XFFE8ECEF),
                backgroundImage: ImageHelper.getImageProvider(data.avatarUrl),
                child: data.avatarUrl == null || data.avatarUrl!.isEmpty
                    ? Text(
                        data.initials,
                        style: const TextStyle(color: Color(0XFF3d4947), fontWeight: FontWeight.w700, fontSize: 14),
                      )
                    : null,
              ),
              const SizedBox(width: 16),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name, 
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "ID: ${data.id.length > 10 ? '${data.id.substring(0, 10)}...' : data.id}",
                    style: TextStyle(
                      color: const Color(0XFF8e9998),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      decoration: data.isCrossedOut ? TextDecoration.lineThrough : null,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
        DataCell(Text(data.date, style: textStyle)),
        DataCell(Text(data.time, style: textStyle)),
        DataCell(_buildStatusBadge(data.status)),
        DataCell(_buildActions(context, ref, data)),
      ],
    );
  }

  /// Builds a stylized status badge.
  /// 
  /// @param status The human-readable status string.
  /// @return A configured [Widget].
  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;
    bool hasDot = false;

    switch (status) {
      case "Upcoming":
        bgColor = const Color(0XFFE8ECEF);
        textColor = const Color(0XFF3d4947);
        hasDot = true;
        break;
      case "Completed":
        bgColor = const Color(0XFFE0F2F1);
        textColor = const Color(0XFF006D60);
        break;
      case "Cancelled":
        bgColor = const Color(0XFFFFEBEE);
        textColor = const Color(0XFFD32F2F);
        break;
      default:
        bgColor = const Color(0XFFE8ECEF);
        textColor = const Color(0XFF3d4947);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasDot) ...[
            Container(width: 6, height: 6, decoration: const BoxDecoration(color: Color(0XFF1976D2), shape: BoxShape.circle)),
            const SizedBox(width: 6),
          ],
          Text(status, style: TextStyle(color: textColor, fontSize: 13, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  /// Orchestrates the action buttons based on the appointment state.
  /// 
  /// @param context The build context.
  /// @param ref The widget ref.
  /// @param data The appointment data.
  /// @return A row of context-aware action buttons.
  Widget _buildActions(BuildContext context, WidgetRef ref, AppointmentData data) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // View History — always available
        TextButton(
          onPressed: () {
            if (data.patientId == null || data.patientId!.isEmpty) {
              ErrorHandler.showWarning(context, 'Patient ID not available for this appointment.');
              return;
            }
            showDialog(
              context: context,
              builder: (ctx) => PatientHistoryDialog(
                patientId: data.patientId!,
                patientName: data.name,
              ),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: const Color(0XFF006D60),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: const Text(
            "View\nHistory",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.2),
          ),
        ),

        // Mark Completed — for Upcoming appointments
        if (data.status == "Upcoming") ...[
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () async {
              try {
                await ref.read(appointmentsViewModelProvider.notifier).updateStatus(data.id, 1);
                if (context.mounted) {
                  ErrorHandler.showSuccess(context, '${data.name}\'s appointment marked as completed.');
                }
              } catch (e) {
                if (context.mounted) ErrorHandler.showError(context, e);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF006D60),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text(
              "Mark\nCompleted",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.2),
            ),
          ),
        ]

        // Record Payment — for Completed appointments that haven't been paid
        else if (data.status == "Completed" && !data.hasPayment) ...[
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => RecordPaymentDialog(
                  patientId: data.patientId ?? '',
                  appointmentId: data.id,
                  patientName: data.name,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF006D60),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: const Text(
              "Record\npayment",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.2),
            ),
          ),
        ],
      ],
    );
  }
}
