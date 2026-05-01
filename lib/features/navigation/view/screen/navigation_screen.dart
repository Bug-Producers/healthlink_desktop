import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthlink_desktop/features/appointments/view/screen/appointment_screen.dart';
import 'package:healthlink_desktop/features/dashboard/view/screen/dashboard_screen.dart';
import 'package:healthlink_desktop/features/financials/view/screen/financials_screen.dart';
import 'package:healthlink_desktop/features/my_schedule/view/screen/my_schedule_screen.dart';
import 'package:healthlink_desktop/features/ratings/view/screen/ratings_screen.dart';
import 'package:healthlink_desktop/features/settings/view/screen/settings_screen.dart';
import 'package:responsive_framework/responsive_framework.dart';

/// [NavigationScreen] acts as the root shell for the authenticated application.
///
/// It implements a [NavigationRail] layout that remains persistent as the user 
/// switches between primary feature modules.
class NavigationScreen extends StatefulWidget {
  /// Constructs a [NavigationScreen].
  /// 
  /// @param key The widget key.
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => NavigationScreenState();
}

/// State for [NavigationScreen], exposing navigation controls to descendant widgets.
class NavigationScreenState extends State<NavigationScreen> {
  /// Current active index in the [IndexedStack].
  int _selectedIndex = 0;

  /// The list of top-level feature screens managed by this navigation shell.
  final List<Widget> _screens = [
    const DashboardScreen(),
    const MyScheduleScreen(),
    const AppointmentScreen(),
    const FinancialsScreen(),
    const RatingsScreen(),
    const SettingsScreen(),
  ];

  /// Programmatically changes the active screen.
  /// 
  /// This is used by global components (like the App Bar profile menu) to 
  /// jump to specific sections of the app.
  /// 
  /// @param index The target index to navigate to.
  void navigateTo(int index) {
    if (index >= 0 && index < _screens.length) {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isDesktopExpanded = ResponsiveBreakpoints.of(context).largerThan(TABLET);

    return Scaffold(
      backgroundColor: const Color(0XFFf9fafc),
      body: SafeArea(
        child: Row(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: NavigationRail(
                        backgroundColor: const Color(0XFFf9fafc),
                        extended: isDesktopExpanded,
                        minExtendedWidth: 287,
                        indicatorColor: Colors.transparent,
                        leading: SizedBox(
                          height: 82,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                isDesktopExpanded ? "HealthLink" : "HL",
                                style: GoogleFonts.inter(
                                  fontSize: isDesktopExpanded ? 20 : 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              if (isDesktopExpanded)
                                Text(
                                  "Clinical Atelier",
                                  style: GoogleFonts.inter(
                                    fontSize: 13,
                                    color: const Color(0XFF3D4947),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        selectedIndex: _selectedIndex,
                        onDestinationSelected: (int index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                        selectedLabelTextStyle: const TextStyle(
                          color: Color(0XFF0d9488),
                          fontWeight: FontWeight.w600,
                        ),
                        unselectedLabelTextStyle: const TextStyle(
                          color: Color(0XFF3d4947),
                        ),
                        destinations: const [
                          NavigationRailDestination(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            icon: Icon(Icons.dashboard_outlined),
                            selectedIcon: Icon(Icons.dashboard, color: Color(0XFF0d9488)),
                            label: Text("Dashboard", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                          NavigationRailDestination(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            icon: Icon(Icons.calendar_today_outlined),
                            selectedIcon: Icon(Icons.calendar_today, color: Color(0XFF0d9488)),
                            label: Text("My Schedule", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                          NavigationRailDestination(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            icon: Icon(Icons.event_note_outlined),
                            selectedIcon: Icon(Icons.event_note, color: Color(0XFF0d9488)),
                            label: Text("Appointments", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                          NavigationRailDestination(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            icon: Icon(Icons.payments_outlined),
                            selectedIcon: Icon(Icons.payments, color: Color(0XFF0d9488)),
                            label: Text("Financials", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                          NavigationRailDestination(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            icon: Icon(Icons.star_border_outlined),
                            selectedIcon: Icon(Icons.star, color: Color(0XFF0d9488)),
                            label: Text("Ratings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                          NavigationRailDestination(
                            padding: EdgeInsets.symmetric(vertical: 8),
                            icon: Icon(Icons.settings_outlined),
                            selectedIcon: Icon(Icons.settings, color: Color(0XFF0d9488)),
                            label: Text("Settings", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const VerticalDivider(thickness: 1, width: 1),
            Expanded(
              child: IndexedStack(
                index: _selectedIndex,
                children: _screens,
              ),
            ),
          ],
        ),
      ),
    );
  }
}