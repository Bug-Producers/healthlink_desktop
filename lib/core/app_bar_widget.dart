import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthlink_desktop/features/navigation/view/screen/navigation_screen.dart';
import 'package:healthlink_desktop/features/login/view/screen/login_screen.dart';
import 'package:healthlink_desktop/core/repositories/doctor_repository.dart';
import 'package:healthlink_desktop/core/repositories/auth_repository.dart';
import 'package:healthlink_desktop/core/network/websocket_client.dart';
import 'package:healthlink_desktop/features/dashboard/view_model/dashboard_view_model.dart';
import 'package:healthlink_desktop/features/appointments/view_model/appointments_view_model.dart';
import 'package:healthlink_desktop/features/financials/view_model/financials_view_model.dart';
import 'package:healthlink_desktop/features/my_schedule/view_model/schedule_view_model.dart';
import 'package:healthlink_desktop/features/ratings/view_model/ratings_view_model.dart';
import 'package:healthlink_desktop/core/utils/image_helper.dart';

/// The [AppBarWidget] serves as the primary global header for the application.
///
/// It provides high-level situational awareness by displaying:
/// 1. Real-time notifications via a persistent WebSocket connection.
/// 2. The authenticated doctor's professional name and profile image.
/// 3. Quick-access actions like account settings and session termination.
class AppBarWidget extends ConsumerStatefulWidget {
  const AppBarWidget({super.key});

  @override
  ConsumerState<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends ConsumerState<AppBarWidget> {
  String _doctorName = 'Doctor';
  String? _doctorImage;
  List<Map<String, dynamic>> _notifications = [];
  int _unreadCount = 0;

  @override
  void initState() {
    super.initState();
    // Synchronize local UI state with the backend upon initialization.
    _loadProfile();
    _loadNotifications();
    _listenToWebSocket();
  }

  /// Retrieves the doctor's profile data to display their name and avatar in the header.
  void _loadProfile() async {
    try {
      final repo = ref.read(doctorRepositoryProvider);
      final profile = await repo.getProfile();
      if (mounted) {
        setState(() {
          _doctorName = profile.name ?? 'Doctor';
          _doctorImage = profile.image;
        });
      }
    } catch (_) {
      // In case of a failure, the app bar retains its default 'Doctor' placeholder.
    }
  }

  /// Populates the notification dropdown with the doctor's recent alerts.
  void _loadNotifications() async {
    try {
      final repo = ref.read(doctorRepositoryProvider);
      final notifs = await repo.getNotifications();
      if (mounted) {
        setState(() {
          _notifications = notifs
              .map((n) => {
                    'id': n.id,
                    'message': n.message,
                    'read': n.read,
                    'date': n.date,
                  })
              .toList();
          _unreadCount = notifs.where((n) => !n.read).length;
        });
      }
    } catch (_) {
      // Fail silently to avoid interrupting the user's workflow.
    }
  }

  /// Establishes a listener on the global WebSocket stream to provide 
  /// instantaneous UI feedback when new events (bookings, etc.) occur.
  void _listenToWebSocket() {
    try {
      final wsClient = ref.read(webSocketClientProvider);
      wsClient.notifications.listen((message) {
        if (mounted) {
          setState(() {
            // Optimistically insert the new notification into the local list.
            _notifications.insert(0, {
              'id': '',
              'message': message,
              'read': false,
              'date': DateTime.now().toIso8601String(),
            });
            _unreadCount++;
          });
          // Refresh from the API to synchronize IDs and persisted state.
          _loadNotifications();
          
          // Auto-refresh the main UI modules when an event occurs.
          ref.invalidate(dashboardViewModelProvider);
          ref.invalidate(appointmentsViewModelProvider);
          ref.invalidate(financialsViewModelProvider);
          ref.invalidate(scheduleViewModelProvider);
          ref.invalidate(ratingsViewModelProvider);
        }
      });
    } catch (_) {
      // WebSocket connectivity issues are handled by the WebSocketClient itself.
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 76,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 40, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Notifications Area
            Stack(
              children: [
                PopupMenuButton<String>(
                  offset: const Offset(0, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  tooltip: 'Recent Notifications',
                  icon: const Icon(Icons.notifications_none),
                  onSelected: (id) async {
                    if (id.isNotEmpty) {
                      try {
                        final repo = ref.read(doctorRepositoryProvider);
                        await repo.markNotificationRead(id);
                        _loadNotifications();
                      } catch (_) {}
                    }
                  },
                  itemBuilder: (context) {
                    if (_notifications.isEmpty) {
                      return [
                        const PopupMenuItem(
                          enabled: false,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                            child: Text(
                              'No recent notifications',
                              style: TextStyle(
                                color: Color(0XFF5a6362),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ];
                    }
                    return _notifications.take(10).map((n) {
                      final isRead = n['read'] == true;
                      return PopupMenuItem<String>(
                        value: n['id'] ?? '',
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 320),
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: isRead ? Colors.transparent : const Color(0xFF006D60),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  n['message'] ?? '',
                                  style: TextStyle(
                                    color: isRead ? const Color(0XFF8e9998) : Colors.black,
                                    fontSize: 13,
                                    fontWeight: isRead ? FontWeight.w500 : FontWeight.w600,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList();
                  },
                ),
                if (_unreadCount > 0)
                  Positioned(
                    right: 8,
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Color(0xFFD32F2F),
                        shape: BoxShape.circle,
                      ),
                      constraints: const BoxConstraints(minWidth: 18, minHeight: 18),
                      child: Text(
                        _unreadCount > 9 ? '9+' : '$_unreadCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(width: 20),

            // Profile & Settings Area
            PopupMenuButton<String>(
              offset: const Offset(0, 56),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              onSelected: (value) async {
                if (value == 'settings') {
                  // Direct the navigation controller to the settings index.
                  final navState = context.findAncestorStateOfType<NavigationScreenState>();
                  navState?.navigateTo(5);
                } else if (value == 'logout') {
                  try {
                    final authRepo = ref.read(authRepositoryProvider);
                    await authRepo.signOut();
                  } catch (_) {}
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  }
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
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xFFE8ECEF),
                      backgroundImage: ImageHelper.getImageProvider(_doctorImage) ??
                          const AssetImage('assets/360_F_396167959_aAhZiGlJoeXOBHivMvaO0Aloxvhg3eVT.jpg') as ImageProvider,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      _doctorName,
                      style: const TextStyle(
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