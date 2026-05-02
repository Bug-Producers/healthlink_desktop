import 'package:flutter/material.dart';
import '../../../../core/models/models.dart';
import '../../../../core/utils/image_helper.dart';

/// A card displaying the next patient waiting, with real appointment data.
///
/// Shows the patient's name, avatar, appointment time, and actions
/// to view records or mark the visit as complete.
class PatientWaitingCard extends StatelessWidget {
  final Appointment appointment;
  final VoidCallback? onMarkComplete;
  final VoidCallback? onViewRecords;

  const PatientWaitingCard({
    super.key,
    required this.appointment,
    this.onMarkComplete,
    this.onViewRecords,
  });

  @override
  Widget build(BuildContext context) {
    final initials = (appointment.patientName != null && appointment.patientName!.isNotEmpty)
        ? appointment.patientName![0].toUpperCase()
        : '?';

    return Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 6, color: const Color(0xFF0E796A)),
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 28, 32, 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 10, height: 10,
                            decoration: const BoxDecoration(
                              color: Color(0xFF006B95),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'NEXT PATIENT WAITING',
                              style: TextStyle(
                                color: Color(0xFF006B95),
                                fontSize: 12, fontWeight: FontWeight.w700,
                                letterSpacing: 1.2,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${appointment.startTime} - ${appointment.endTime}',
                      style: const TextStyle(
                        color: Color(0xFF1A1A2E),
                        fontSize: 16, fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 38,
                      backgroundColor: const Color(0xFFE8ECEF),
                      backgroundImage: ImageHelper.getImageProvider(appointment.patientImage),
                      child: appointment.patientImage == null || appointment.patientImage!.isEmpty
                          ? Text(
                              initials,
                              style: const TextStyle(
                                color: Color(0xFF3d4947),
                                fontWeight: FontWeight.w700,
                                fontSize: 24,
                              ),
                            )
                          : null,
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appointment.patientName ?? 'Unknown Patient',
                            style: const TextStyle(
                              color: Color(0xFF1A1A2E),
                              fontSize: 28, fontWeight: FontWeight.w800,
                              letterSpacing: -0.5,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            appointment.date,
                            style: const TextStyle(
                              color: Color(0xFF5a6362),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Flexible(
                            child: TextButton(
                              onPressed: onViewRecords,
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF0E796A),
                              ),
                              child: const Text('View Records', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700), overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: onMarkComplete,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0E796A),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        elevation: 0,
                      ),
                      icon: Container(
                        width: 22, height: 22,
                        decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                        child: const Icon(Icons.play_arrow_rounded, color: Color(0xFF0E796A), size: 16),
                      ),
                      label: const Text('Mark as complete', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
