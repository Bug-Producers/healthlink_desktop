import 'package:flutter/material.dart';
import '../features/navigation/view/screen/navigation_screen.dart';
import '../features/login/view/screen/login_screen.dart';
/// A reusable application bar widget displayed across various main screens.
///
/// This widget provides top-level navigation utilities, including a notification
/// bell (which displays an empty updates state) and a profile dropdown menu
/// that allows the user to navigate to settings or log out of the application.
///
/// @param key The widget key.
class AppBarWidget extends StatelessWidget {
  /// Constructs the [AppBarWidget].
  const AppBarWidget({
    super.key,
  });

  /// Builds the app bar layout containing the notification and profile menus.
  ///
  /// @param context The build context.
  /// @return A constrained [SizedBox] containing the app bar actions.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 76,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            PopupMenuButton<String>(
              offset: const Offset(0, 48),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              tooltip: 'Notifications',
              icon: const Icon(Icons.notifications_none),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  enabled: false,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                    child: Text(
                      'No updates',
                      style: TextStyle(
                        color: Color(0XFF5a6362),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),

            PopupMenuButton<String>(
              offset: const Offset(0, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onSelected: (value) {
                if (value == 'settings') {
                  final navState = context.findAncestorStateOfType<NavigationScreenState>();
                  navState?.navigateTo(5);
                } else if (value == 'logout') {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'settings',
                  child: Row(
                    children: [
                      Icon(Icons.settings, size: 20, color: Color(0XFF5a6362)),
                      SizedBox(width: 12),
                      Text('Settings', style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 20, color: Colors.red),
                      SizedBox(width: 12),
                      Text('Log out', style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/360_F_396167959_aAhZiGlJoeXOBHivMvaO0Aloxvhg3eVT.jpg',
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Dr. Julianne Smith',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.keyboard_arrow_down, size: 20, color: Color(0XFF5a6362)),
                    const SizedBox(width: 4),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}