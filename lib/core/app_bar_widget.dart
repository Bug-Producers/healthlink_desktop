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

class _AppBarWidgetState extends ConsumerState<AppBarWidget>
    with SingleTickerProviderStateMixin {
  String _doctorName = 'Doctor';
  String? _doctorImage;
  List<Map<String, dynamic>> _notifications = [];
  int _unreadCount = 0;

  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _pulseAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _loadProfile();
    _loadNotifications();
    _listenToWebSocket();
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _removeOverlay();
    super.dispose();
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
        _overlayEntry?.markNeedsBuild();
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
            _notifications.insert(0, {
              'id': '',
              'message': message,
              'read': false,
              'date': DateTime.now().toIso8601String(),
            });
            _unreadCount++;
          });
          _loadNotifications();

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

  // ---------------------------------------------------------------------------
  // Overlay helpers
  // ---------------------------------------------------------------------------

  void _toggleOverlay() {
    if (_overlayEntry != null) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    _overlayEntry = OverlayEntry(
      builder: (ctx) => _NotificationPanel(
        layerLink: _layerLink,
        notifications: _notifications,
        onClose: _removeOverlay,
        onMarkRead: (id) async {
          if (id.isNotEmpty) {
            try {
              final repo = ref.read(doctorRepositoryProvider);
              await repo.markNotificationRead(id);
              _loadNotifications();
            } catch (_) {}
          }
        },
        onMarkAllRead: () async {
          final unread =
              _notifications.where((n) => n['read'] != true).toList();
          for (final n in unread) {
            final id = n['id'] ?? '';
            if (id.isNotEmpty) {
              try {
                final repo = ref.read(doctorRepositoryProvider);
                await repo.markNotificationRead(id);
              } catch (_) {}
            }
          }
          _loadNotifications();
          _removeOverlay();
        },
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  // ---------------------------------------------------------------------------
  // Build
  // ---------------------------------------------------------------------------

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
            // Notifications bell
            CompositedTransformTarget(
              link: _layerLink,
              child: GestureDetector(
                onTap: _toggleOverlay,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (_, child) {
                        return Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: _unreadCount > 0
                                    ? const Color(0xFF006D60).withValues(
                                        alpha:
                                            0.18 * _pulseAnimation.value)
                                    : Colors.black.withValues(alpha: 0.06),
                                blurRadius: _unreadCount > 0
                                    ? 12 * _pulseAnimation.value
                                    : 8,
                                spreadRadius: _unreadCount > 0
                                    ? 2 * _pulseAnimation.value
                                    : 0,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.notifications_outlined,
                            size: 22,
                            color: Color(0xFF374151),
                          ),
                        );
                      },
                    ),
                    if (_unreadCount > 0)
                      Positioned(
                        right: -2,
                        top: -2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFFEF4444),
                                Color(0xFFDC2626),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            shape: BoxShape.circle,
                            border:
                                Border.all(color: Colors.white, width: 1.5),
                          ),
                          constraints: const BoxConstraints(
                              minWidth: 20, minHeight: 20),
                          child: Text(
                            _unreadCount > 9 ? '9+' : '$_unreadCount',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              height: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),

            // Profile & Settings
            PopupMenuButton<String>(
              offset: const Offset(0, 56),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onSelected: (value) async {
                if (value == 'settings') {
                  final navState =
                      context.findAncestorStateOfType<NavigationScreenState>();
                  navState?.navigateTo(5);
                } else if (value == 'logout') {
                  try {
                    final authRepo = ref.read(authRepositoryProvider);
                    await authRepo.signOut();
                  } catch (_) {}
                  if (context.mounted) {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()),
                    );
                  }
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 'settings',
                  child: Row(
                    children: [
                      Icon(Icons.settings,
                          size: 20, color: Color(0XFF5a6362)),
                      SizedBox(width: 12),
                      Text('Settings',
                          style: TextStyle(fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: 'logout',
                  child: Row(
                    children: [
                      Icon(Icons.logout, size: 20, color: Colors.red),
                      SizedBox(width: 12),
                      Text('Log out',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500)),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0xFFE8ECEF),
                      backgroundImage:
                          ImageHelper.getImageProvider(_doctorImage) ??
                              const AssetImage(
                                      'assets/360_F_396167959_aAhZiGlJoeXOBHivMvaO0Aloxvhg3eVT.jpg')
                                  as ImageProvider,
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
                    const Icon(Icons.keyboard_arrow_down,
                        size: 20, color: Color(0XFF5a6362)),
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

// =============================================================================
// Notification Panel Overlay
// =============================================================================

class _NotificationPanel extends StatefulWidget {
  final LayerLink layerLink;
  final List<Map<String, dynamic>> notifications;
  final VoidCallback onClose;
  final Future<void> Function(String id) onMarkRead;
  final VoidCallback onMarkAllRead;

  const _NotificationPanel({
    required this.layerLink,
    required this.notifications,
    required this.onClose,
    required this.onMarkRead,
    required this.onMarkAllRead,
  });

  @override
  State<_NotificationPanel> createState() => _NotificationPanelState();
}

class _NotificationPanelState extends State<_NotificationPanel>
    with SingleTickerProviderStateMixin {
  late AnimationController _animCtrl;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _animCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _fadeAnim =
        CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, -0.05),
      end: Offset.zero,
    ).animate(
        CurvedAnimation(parent: _animCtrl, curve: Curves.easeOut));
    _animCtrl.forward();
  }

  @override
  void dispose() {
    _animCtrl.dispose();
    super.dispose();
  }

  String _relativeTime(String? isoDate) {
    if (isoDate == null || isoDate.isEmpty) return '';
    try {
      final dt = DateTime.parse(isoDate).toLocal();
      final diff = DateTime.now().difference(dt);
      if (diff.inSeconds < 60) return 'Just now';
      if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
      if (diff.inHours < 24) return '${diff.inHours}h ago';
      if (diff.inDays < 7) return '${diff.inDays}d ago';
      return '${dt.day}/${dt.month}/${dt.year}';
    } catch (_) {
      return '';
    }
  }

  IconData _iconForMessage(String? msg) {
    final m = (msg ?? '').toLowerCase();
    if (m.contains('booking') || m.contains('appointment')) {
      return Icons.calendar_today_rounded;
    }
    if (m.contains('payment') || m.contains('paid')) {
      return Icons.payments_rounded;
    }
    if (m.contains('cancel')) return Icons.cancel_rounded;
    if (m.contains('confirm')) return Icons.check_circle_rounded;
    if (m.contains('rating') || m.contains('review')) {
      return Icons.star_rounded;
    }
    return Icons.notifications_rounded;
  }

  Color _colorForMessage(String? msg) {
    final m = (msg ?? '').toLowerCase();
    if (m.contains('booking') || m.contains('appointment')) {
      return const Color(0xFF006D60);
    }
    if (m.contains('payment') || m.contains('paid')) {
      return const Color(0xFF7C3AED);
    }
    if (m.contains('cancel')) return const Color(0xFFDC2626);
    if (m.contains('confirm')) return const Color(0xFF059669);
    if (m.contains('rating') || m.contains('review')) {
      return const Color(0xFFF59E0B);
    }
    return const Color(0xFF3B82F6);
  }

  @override
  Widget build(BuildContext context) {
    final hasUnread =
        widget.notifications.any((n) => n['read'] != true);

    return Stack(
      children: [
        // Dismiss backdrop
        Positioned.fill(
          child: GestureDetector(
            onTap: widget.onClose,
            behavior: HitTestBehavior.translucent,
            child: const SizedBox.expand(),
          ),
        ),

        // Panel
        CompositedTransformFollower(
          link: widget.layerLink,
          offset: const Offset(-290, 52),
          child: FadeTransition(
            opacity: _fadeAnim,
            child: SlideTransition(
              position: _slideAnim,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  width: 360,
                  constraints: const BoxConstraints(maxHeight: 520),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 32,
                        offset: const Offset(0, 8),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Header
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(20, 18, 16, 16),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF006D60),
                                Color(0xFF00897B),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.notifications_rounded,
                                color: Colors.white,
                                size: 22,
                              ),
                              const SizedBox(width: 10),
                              const Expanded(
                                child: Text(
                                  'Notifications',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.3,
                                  ),
                                ),
                              ),
                              if (hasUnread)
                                GestureDetector(
                                  onTap: widget.onMarkAllRead,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                          .withValues(alpha: 0.2),
                                      borderRadius:
                                          BorderRadius.circular(20),
                                    ),
                                    child: const Text(
                                      'Mark all read',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              const SizedBox(width: 6),
                              GestureDetector(
                                onTap: widget.onClose,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.white
                                        .withValues(alpha: 0.15),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close_rounded,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Body
                        if (widget.notifications.isEmpty)
                          _EmptyState()
                        else
                          Flexible(
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8),
                              shrinkWrap: true,
                              itemCount:
                                  widget.notifications.take(15).length,
                              separatorBuilder: (_, __) => Divider(
                                height: 1,
                                indent: 68,
                                endIndent: 16,
                                color: const Color(0xFFF3F4F6),
                              ),
                              itemBuilder: (ctx, i) {
                                final n = widget.notifications[i];
                                final isRead = n['read'] == true;
                                final msg =
                                    n['message'] as String? ?? '';
                                final timeStr = _relativeTime(
                                    n['date'] as String?);
                                final iconData =
                                    _iconForMessage(msg);
                                final iconColor =
                                    _colorForMessage(msg);

                                return _NotificationTile(
                                  message: msg,
                                  timeStr: timeStr,
                                  isRead: isRead,
                                  iconData: iconData,
                                  iconColor: iconColor,
                                  onTap: () {
                                    widget.onMarkRead(
                                        n['id'] ?? '');
                                    widget.onClose();
                                  },
                                );
                              },
                            ),
                          ),

                        // Footer
                        if (widget.notifications.isNotEmpty)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                    color: const Color(0xFFF3F4F6),
                                    width: 1),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${widget.notifications.length} notifications',
                                  style: const TextStyle(
                                    color: Color(0xFF9CA3AF),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// =============================================================================
// Individual Notification Tile
// =============================================================================

class _NotificationTile extends StatefulWidget {
  final String message;
  final String timeStr;
  final bool isRead;
  final IconData iconData;
  final Color iconColor;
  final VoidCallback onTap;

  const _NotificationTile({
    required this.message,
    required this.timeStr,
    required this.isRead,
    required this.iconData,
    required this.iconColor,
    required this.onTap,
  });

  @override
  State<_NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<_NotificationTile> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          color: _hovering
              ? const Color(0xFFF0FDF8)
              : widget.isRead
                  ? Colors.white
                  : const Color(0xFFF0FDF8).withValues(alpha: 0.6),
          padding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon avatar
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color:
                      widget.iconColor.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(widget.iconData,
                    size: 20, color: widget.iconColor),
              ),
              const SizedBox(width: 12),
              // Text content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.message,
                      style: TextStyle(
                        color: widget.isRead
                            ? const Color(0xFF6B7280)
                            : const Color(0xFF111827),
                        fontSize: 13,
                        fontWeight: widget.isRead
                            ? FontWeight.w400
                            : FontWeight.w600,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (widget.timeStr.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        widget.timeStr,
                        style: const TextStyle(
                          color: Color(0xFF9CA3AF),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              // Unread dot
              if (!widget.isRead)
                Padding(
                  padding: const EdgeInsets.only(top: 4, left: 8),
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: const BoxDecoration(
                      color: Color(0xFF006D60),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// =============================================================================
// Empty State
// =============================================================================

class _EmptyState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: const Color(0xFF006D60).withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.notifications_off_outlined,
              size: 34,
              color: Color(0xFF006D60),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'All caught up!',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'No new notifications right now.\nWe\'ll let you know when something arrives.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              color: Color(0xFF9CA3AF),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}