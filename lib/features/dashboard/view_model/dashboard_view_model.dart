import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/doctor_repository.dart';
import '../../../../core/repositories/financial_repository.dart';

part 'dashboard_view_model.g.dart';

/// [DashboardData] is a data container for all information shown on the main dashboard.
class DashboardData {
  /// The doctor's profile information.
  final DoctorProfile profile;
  /// List of appointments for the doctor.
  final List<Appointment> appointments;
  /// Financial performance data.
  final RevenueData revenue;
  /// Aggregated ratings and reviews.
  final RatingsData ratings;
  /// List of system-level notifications.
  final List<SystemNotification> notifications;

  /// Constructs [DashboardData] with all required properties.
  /// 
  /// @param profile The doctor profile.
  /// @param appointments List of all appointments.
  /// @param revenue Summary of earnings.
  /// @param ratings Average and individual reviews.
  /// @param notifications Alerts and system messages.
  DashboardData({
    required this.profile,
    required this.appointments,
    required this.revenue,
    required this.ratings,
    required this.notifications,
  });

  /// Calculates the count of non-completed appointments for today.
  /// 
  /// @return The integer count of today's pending appointments.
  int get todayAppointmentCount {
    final today = DateTime.now();
    final todayStr = '${today.year}-${today.month.toString().padLeft(2, '0')}-${today.day.toString().padLeft(2, '0')}';
    return appointments.where((a) => a.date == todayStr && a.status == 0).length;
  }

  /// Filters all appointments with a status of 'Booked' (0).
  /// 
  /// @return A filtered [List] of upcoming appointments.
  List<Appointment> get upcomingAppointments {
    return appointments.where((a) => a.status == 0).toList();
  }
}

/// The [DashboardViewModel] manages the business logic and state for the dashboard UI.
@riverpod
class DashboardViewModel extends _$DashboardViewModel {
  /// Initializes the dashboard state by fetching all data in parallel.
  /// 
  /// @return A [Future] resolving to the initial [DashboardData] state.
  @override
  Future<DashboardData> build() async {
    final doctorRepo = ref.watch(doctorRepositoryProvider);
    final financialRepo = ref.watch(financialRepositoryProvider);

    final results = await Future.wait([
      doctorRepo.getProfile(),
      doctorRepo.getAppointments(),
      financialRepo.getRevenue(),
      doctorRepo.getRatings(),
      doctorRepo.getNotifications(),
      financialRepo.getPayments(),
    ]);

    final revenue = results[2] as RevenueData;
    final payments = results[5] as List<Payment>;

    // Calculate real total from payments for accuracy
    final calculatedTotal = payments.fold(0.0, (sum, p) => sum + (p.amount ?? 0.0));
    final finalRevenue = revenue.copyWith(
      totalEarnings: revenue.totalEarnings! < calculatedTotal ? calculatedTotal : revenue.totalEarnings,
    );

    return DashboardData(
      profile: results[0] as DoctorProfile,
      appointments: results[1] as List<Appointment>,
      revenue: finalRevenue,
      ratings: results[3] as RatingsData,
      notifications: results[4] as List<SystemNotification>,
    );
  }

  /// Updates the profile on the server and invalidates the current dashboard state.
  /// 
  /// @param profile The new profile information.
  /// @return A [Future] that completes when the update and refresh are finished.
  Future<void> updateProfile(DoctorProfile profile) async {
    final repository = ref.read(doctorRepositoryProvider);
    await repository.updateProfile(profile);
    ref.invalidateSelf();
  }

  /// Updates an appointment's status and triggers a state refresh.
  /// 
  /// @param id The appointment ID.
  /// @param status The new status value.
  /// @return A [Future] that completes after the update.
  Future<void> updateAppointmentStatus(String id, int status) async {
    final repository = ref.read(doctorRepositoryProvider);
    await repository.updateAppointmentStatus(id, status);
    ref.invalidateSelf();
  }

  /// Manually forces a refresh of the dashboard data.
  void refresh() {
    ref.invalidateSelf();
  }
}
