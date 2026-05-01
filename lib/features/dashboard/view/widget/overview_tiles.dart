import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// [OverViewTiles] is a reusable metric card used to display key clinical 
/// statistics on the dashboard.
class OverViewTiles extends StatelessWidget {
  /// The descriptive label for the metric (e.g., "TOTAL REVENUE").
  final String title;
  /// The icon representing the metric category.
  final IconData icon;
  /// The primary numeric or text value to display.
  final String value;
  /// A secondary label providing context (e.g., "Patients").
  final String subtitle;
  /// The color of the icon.
  final Color iconColor;
  /// The background color of the icon's container.
  final Color iconBackgroundColor;

  /// Constructs an [OverViewTiles] card.
  /// 
  /// @param title The metric title.
  /// @param icon The category icon.
  /// @param value The primary value.
  /// @param subtitle The contextual subtitle.
  /// @param iconColor The icon's foreground color.
  /// @param iconBackgroundColor The icon's background color.
  const OverViewTiles({
    super.key,
    required this.title,
    required this.icon,
    required this.value,
    required this.subtitle,
    this.iconColor = const Color(0XFF00685f),
    this.iconBackgroundColor = const Color(0XFFeceef0),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ResponsiveValue(
        context,
        defaultValue: 156.0,
        conditionalValues: [
          const Condition.smallerThan(name: TABLET, value: 140.0),
        ],
      ).value,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: const Color(0XFF3d4947),
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 13.0,
                      conditionalValues: [
                        const Condition.largerThan(name: TABLET, value: 14.0),
                        const Condition.smallerThan(name: TABLET, value: 12.0),
                      ],
                    ).value,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: iconBackgroundColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(icon, color: iconColor),
              ),
            ],
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ResponsiveValue(
                        context,
                        defaultValue: 36.0,
                        conditionalValues: [
                          const Condition.smallerThan(name: TABLET, value: 28.0),
                        ],
                      ).value,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 6.0),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    color: const Color(0XFF3d4947),
                    fontSize: ResponsiveValue(
                      context,
                      defaultValue: 16.0,
                      conditionalValues: [
                        const Condition.smallerThan(name: TABLET, value: 14.0),
                      ],
                    ).value,
                    fontWeight: FontWeight.w600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
