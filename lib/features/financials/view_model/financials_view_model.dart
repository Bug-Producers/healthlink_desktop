import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/financial_repository.dart';
import '../../dashboard/view_model/dashboard_view_model.dart';

part 'financials_view_model.g.dart';

/// [FinancialsData] aggregates both analytical revenue metrics and raw 
/// payment logs into a single state container.
class FinancialsData {
  /// Aggregated revenue summaries and breakdown data.
  final RevenueData revenue;
  
  /// A list of individual payment transactions.
  final List<Payment> payments;

  /// Constructs [FinancialsData].
  /// 
  /// @param revenue The analytical revenue data.
  /// @param payments The list of payment records.
  FinancialsData({required this.revenue, required this.payments});
}

/// The [FinancialsViewModel] provides the business logic for the Financial Hub.
///
/// It fetches analytical and transactional data in parallel to provide a 
/// holistic view of clinical earnings.
@riverpod
class FinancialsViewModel extends _$FinancialsViewModel {
  /// Fetches revenue and payment data from the repository.
  /// 
  /// @return A [Future] resolving to the combined [FinancialsData].
  @override
  Future<FinancialsData> build() async {
    final repository = ref.watch(financialRepositoryProvider);
    final results = await Future.wait([
      repository.getRevenue(),
      repository.getPayments(),
    ]);
    final revenue = results[0] as RevenueData;
    final payments = results[1] as List<Payment>;

    // Calculate daily breakdown from payments to ensure the graph is always up to date
    final Map<String, double> breakdownMap = {};
    final String todayDate = DateTime.now().toIso8601String().split('T')[0];
    
    // Process payments to ensure they all have dates
    final processedPayments = payments.map((p) {
      if (p.date == null || p.date!.isEmpty || p.date == '-') {
        return p.copyWith(date: todayDate);
      }
      return p;
    }).toList();

    for (var payment in processedPayments) {
      final date = payment.date!;
      breakdownMap[date] = (breakdownMap[date] ?? 0.0) + (payment.amount ?? 0.0);
    }

    final sortedDates = breakdownMap.keys.toList()..sort();
    final List<DailyBreakdown> calculatedBreakdown = sortedDates.map((date) {
      return DailyBreakdown(date: date, total: breakdownMap[date]);
    }).toList();

    // Calculate total earnings if backend total is 0 or less than calculated
    final calculatedTotal = breakdownMap.values.fold(0.0, (sum, val) => sum + val);
    final totalEarnings = (revenue.totalEarnings ?? 0.0) < calculatedTotal ? calculatedTotal : revenue.totalEarnings;

    return FinancialsData(
      revenue: revenue.copyWith(
        dailyBreakdown: calculatedBreakdown,
        totalEarnings: totalEarnings,
        totalPayments: processedPayments.length,
      ),
      payments: processedPayments,
    );
  }

  /// Submits a new payment record and refreshes the financial state.
  /// 
  /// @param payment The payment details to record.
  /// @return A [Future] that completes when the record is saved.
  Future<void> recordPayment(Payment payment) async {
    final repository = ref.read(financialRepositoryProvider);
    await repository.recordPayment(payment);

    // Optimistically update the state to preserve the local date instantly
    final currentState = state.value;
    if (currentState != null) {
      final newPayments = [payment, ...currentState.payments];
      
      final Map<String, double> breakdownMap = {};
      for (var p in newPayments) {
        final date = p.date ?? DateTime.now().toIso8601String().split('T')[0];
        breakdownMap[date] = (breakdownMap[date] ?? 0.0) + (p.amount ?? 0.0);
      }

      final sortedDates = breakdownMap.keys.toList()..sort();
      final List<DailyBreakdown> calculatedBreakdown = sortedDates.map((date) {
        return DailyBreakdown(date: date, total: breakdownMap[date]);
      }).toList();

      final calculatedTotal = breakdownMap.values.fold(0.0, (sum, val) => sum + val);

      state = AsyncValue.data(
        FinancialsData(
          revenue: currentState.revenue.copyWith(
            dailyBreakdown: calculatedBreakdown,
            totalEarnings: calculatedTotal,
            totalPayments: newPayments.length,
          ),
          payments: newPayments,
        ),
      );
    } else {
      ref.invalidateSelf();
    }
    
    ref.invalidate(dashboardViewModelProvider);
  }
}
