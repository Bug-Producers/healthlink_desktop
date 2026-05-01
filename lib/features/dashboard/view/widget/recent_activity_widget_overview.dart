import 'package:flutter/material.dart';
import '../../../../core/models/models.dart';

/// Displays a list of recent system notifications as activity items.
class RecentActivityWidget extends StatelessWidget {
  final List<SystemNotification> notifications;

  const RecentActivityWidget({super.key, this.notifications = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 2.25),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'RECENT ACTIVITY',
            style: TextStyle(
              fontSize: 16.5, fontWeight: FontWeight.w700,
              letterSpacing: 1.8, color: Color(0xFF1A1A2E),
            ),
          ),
          const SizedBox(height: 24),
          if (notifications.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(
                child: Text(
                  'No recent activity',
                  style: TextStyle(color: Color(0xFF8A8A8A), fontSize: 15),
                ),
              ),
            )
          else
            ...notifications.take(5).map((n) {
              IconData icon;
              Color iconColor;
              Color iconBgColor;
              final msg = n.message.toLowerCase();

              if (msg.contains('booking') || msg.contains('booked') || msg.contains('appointment')) {
                icon = Icons.person_add_alt_1_outlined;
                iconColor = const Color(0xFF5B9BD5);
                iconBgColor = const Color(0xFFEBF3FB);
              } else if (msg.contains('rating') || msg.contains('star') || msg.contains('review')) {
                icon = Icons.star;
                iconColor = const Color(0xFFE2732A);
                iconBgColor = const Color(0xFFFDF3EC);
              } else if (msg.contains('cancel')) {
                icon = Icons.cancel_outlined;
                iconColor = const Color(0xFFD32F2F);
                iconBgColor = const Color(0xFFFFEBEE);
              } else if (msg.contains('complete')) {
                icon = Icons.check_circle_outline;
                iconColor = const Color(0xFF006D60);
                iconBgColor = const Color(0xFFE0F2F1);
              } else {
                icon = Icons.notifications_outlined;
                iconColor = const Color(0xFF8A8A8A);
                iconBgColor = const Color(0xFFF2F2F2);
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 54, height: 54,
                      decoration: BoxDecoration(
                        color: iconBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(icon, color: iconColor, size: 27),
                    ),
                    const SizedBox(width: 18),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            n.message,
                            style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600,
                              color: Color(0xFF1A1A2E), height: 1.3,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4.5),
                          Text(
                            n.date ?? '',
                            style: const TextStyle(
                              fontSize: 14, color: Color(0xFF8A8A8A), height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
        ],
      ),
    );
  }
}