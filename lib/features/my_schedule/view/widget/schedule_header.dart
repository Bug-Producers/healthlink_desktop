import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ScheduleHeaderWidget extends StatelessWidget {
  const ScheduleHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth > 600;

        return ResponsiveRowColumn(
          layout: isDesktop ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
          rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
          rowCrossAxisAlignment: CrossAxisAlignment.start,
          columnCrossAxisAlignment: CrossAxisAlignment.start,
          columnSpacing: 20,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: isDesktop ? 1 : null,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Schedule Management",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 36,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Configure your weekly availability and consultation parameters to ensure a smooth\nbooking experience for your patients.",
                    style: TextStyle(
                      color: Color(0XFF5a6362),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            ResponsiveRowColumnItem(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: [
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Changes discarded.'),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0XFFe8ecef),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Discard\nChanges",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0XFF0d4c6d),
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Schedule saved successfully!'),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Color(0XFF006D60),
                        ),
                      );
                    },
                    icon: const Icon(Icons.save_outlined, size: 20, color: Colors.white),
                    label: const Text(
                      "Save\nSchedule",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        height: 1.2,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFF006D60),
                      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
