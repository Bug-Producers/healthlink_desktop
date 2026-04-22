import 'package:flutter/material.dart';

class RecentActivityWidget extends StatelessWidget {
  const RecentActivityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Fill parent
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white, width: 2.25),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Text(
            'RECENT ACTIVITY',
            style: TextStyle(
              fontSize: 16.5, fontWeight: FontWeight.w700,
              letterSpacing: 1.8, color: Color(0xFF1A1A2E),
            ),
          ),
          SizedBox(height: 24),
          _ActivityItem(
            icon: Icons.person_add_alt_1_outlined,
            iconColor: Color(0xFF5B9BD5), iconBgColor: Color(0xFFEBF3FB),
            title: 'New booking: Michael Chen', subtitle: 'Tomorrow at 9:00 AM',
          ),
          SizedBox(height: 24),
          _ActivityItem(
            icon: Icons.star_outline,
            iconColor: Color(0xFFE2732A), iconBgColor: Color(0xFFFDF3EC),
            title: 'Rating received: 5 stars', subtitle: "From Emily R. for yesterday's visit",
            iconFilled: true,
          ),
          SizedBox(height: 24),
          _ActivityItem(
            icon: Icons.check_circle_outline,
            iconColor: Color(0xFF8A8A8A), iconBgColor: Color(0xFFF2F2F2),
            title: 'Visit completed: Sarah J.', subtitle: 'Notes successfully synced to EMR',
          ),
        ],
      ),
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final bool iconFilled;

  const _ActivityItem({
    required this.icon, required this.iconColor, required this.iconBgColor,
    required this.title, required this.subtitle, this.iconFilled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 54, height: 54,
          decoration: BoxDecoration(color: iconBgColor, borderRadius: BorderRadius.circular(12)),
          child: Icon(iconFilled ? Icons.star : icon, color: iconColor, size: 27),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 20.25, fontWeight: FontWeight.w600, color: Color(0xFF1A1A2E), height: 1.3)),
              const SizedBox(height: 4.5),
              Text(subtitle, style: const TextStyle(fontSize: 18, color: Color(0xFF8A8A8A), height: 1.4)),
            ],
          ),
        ),
      ],
    );
  }
}