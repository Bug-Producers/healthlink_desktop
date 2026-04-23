import 'package:flutter/material.dart';
import 'record_payment_dialog.dart';

/// A data model representing a single appointment.
///
/// Contains information about the patient, time, and current status of the
/// scheduled appointment.
class AppointmentData {
  /// The full name of the patient.
  final String name;

  /// A unique identifier for the appointment.
  final String id;

  /// An optional URL pointing to the patient's avatar image.
  final String? avatarUrl;

  /// The initials of the patient, used as a fallback if [avatarUrl] is null.
  final String initials;

  /// The formatted date of the appointment.
  final String date;

  /// The formatted time of the appointment.
  final String time;

  /// The current status (e.g., "Upcoming", "Completed", "Cancelled").
  final String status;

  /// Indicates if the appointment record should be visually crossed out.
  final bool isCrossedOut;

  /// Constructs an [AppointmentData] instance.
  ///
  /// @param name The patient's full name.
  /// @param id The unique appointment ID.
  /// @param avatarUrl Optional image URL.
  /// @param initials Fallback text for the avatar.
  /// @param date Appointment date.
  /// @param time Appointment time.
  /// @param status The appointment status.
  /// @param isCrossedOut Whether the item is crossed out (defaults to false).
  AppointmentData({
    required this.name,
    required this.id,
    this.avatarUrl,
    required this.initials,
    required this.date,
    required this.time,
    required this.status,
    this.isCrossedOut = false,
  });
}

/// A stateful-like widget that displays a table of recent appointments.
///
/// This widget handles rendering a responsive [DataTable] showing patient details,
/// schedules, statuses, and contextual actions.
///
/// @param key The widget key.
class AppointmentsListWidget extends StatelessWidget {
  /// Constructs the [AppointmentsListWidget].
  const AppointmentsListWidget({super.key});

  /// Builds the table wrapper and the data table itself.
  ///
  /// @param context The build context.
  /// @return A container with a horizontally scrollable table.
  @override
  Widget build(BuildContext context) {
    final List<AppointmentData> mockData = [
      AppointmentData(
        name: "Sarah Jenkins",
        id: "#99281",
        avatarUrl: "https://randomuser.me/api/portraits/women/44.jpg",
        initials: "SJ",
        date: "Oct 24, 2023",
        time: "10:30 AM",
        status: "Upcoming",
      ),
      AppointmentData(
        name: "Michael Roberts",
        id: "#88372",
        avatarUrl: null,
        initials: "MR",
        date: "Oct 24, 2023",
        time: "11:15 AM",
        status: "Completed",
      ),
      AppointmentData(
        name: "David Chen",
        id: "#44921",
        avatarUrl: "https://randomuser.me/api/portraits/men/32.jpg",
        initials: "DC",
        date: "Oct 24, 2023",
        time: "01:00 PM",
        status: "Cancelled",
        isCrossedOut: true,
      ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: Theme(
                data: Theme.of(context).copyWith(
                  dividerColor: const Color(0XFFF1F4F5),
                ),
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(Color(0XFFf2f4f6)),
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
                  rows: mockData.map((data) => _buildRow(context, data)).toList(),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// Builds a single data row for the table.
  ///
  /// @param context The build context used for generating dialogs.
  /// @param data The [AppointmentData] to populate the row.
  /// @return A configured [DataRow] for the data table.
  DataRow _buildRow(BuildContext context, AppointmentData data) {
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
                backgroundImage: data.avatarUrl != null ? NetworkImage(data.avatarUrl!) : null,
                child: data.avatarUrl == null
                    ? Text(
                        data.initials,
                        style: const TextStyle(
                          color: Color(0XFF3d4947),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
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
                  ),
                  Text(
                    "ID: ${data.id}",
                    style: TextStyle(
                      color: const Color(0XFF8e9998),
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      decoration: data.isCrossedOut ? TextDecoration.lineThrough : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        DataCell(Text(data.date, style: textStyle)),
        DataCell(Text(data.time, style: textStyle)),
        DataCell(_buildStatusBadge(data.status)),
        DataCell(_buildActions(context, data.status)),
      ],
    );
  }

  /// Generates a styled badge representing the current status.
  ///
  /// Styles the badge with dynamic background colors, text colors, and indicators
  /// depending on whether the status is "Upcoming", "Completed", or "Cancelled".
  ///
  /// @param status The string representing the appointment status.
  /// @return A decorated container rendering the status visually.
  Widget _buildStatusBadge(String status) {
    Color bgColor;
    Color textColor;
    bool hasDot = false;

    switch (status) {
      case "Upcoming":
        bgColor = const Color(0XFFE8ECEF); // Light grey
        textColor = const Color(0XFF3d4947);
        hasDot = true;
        break;
      case "Completed":
        bgColor = const Color(0XFFE0F2F1); // Light green
        textColor = const Color(0XFF006D60); // Dark green
        break;
      case "Cancelled":
        bgColor = const Color(0XFFFFEBEE); // Light red
        textColor = const Color(0XFFD32F2F); // Dark red
        break;
      default:
        bgColor = const Color(0XFFE8ECEF);
        textColor = const Color(0XFF3d4947);
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (hasDot) ...[
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0XFF1976D2), // Blue dot
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            status,
            style: TextStyle(
              color: textColor,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  /// Generates action buttons for an appointment based on its status.
  ///
  /// "Completed" appointments receive a "Record payment" button.
  /// "Upcoming" appointments receive a "Mark Completed" button.
  /// All statuses have a generic "View History" button.
  ///
  /// @param context The build context used for rendering action modals.
  /// @param status The current status string.
  /// @return A row containing relevant action buttons.
  Widget _buildActions(BuildContext context, String status) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: const Color(0XFF006D60),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          ),
          child: Text(
            status == "Cancelled" ? "View History" : "View\nHistory",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.2),
          ),
        ),
        if (status == "Upcoming") ...[
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF006D60),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Mark\nCompleted",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.2),
            ),
          ),
        ] else if (status == "Completed") ...[
          const SizedBox(width: 12),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const RecordPaymentDialog(),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0XFF006D60),
              foregroundColor: Colors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text(
              "Record\npayment",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, height: 1.2),
            ),
          ),
        ]
      ],
    );
  }
}
