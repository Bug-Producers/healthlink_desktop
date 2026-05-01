import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/financial_repository.dart';

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
    return FinancialsData(
      revenue: results[0] as RevenueData,
      payments: results[1] as List<Payment>,
    );
  }

  /// Submits a new payment record and refreshes the financial state.
  /// 
  /// @param payment The payment details to record.
  /// @return A [Future] that completes when the record is saved.
  Future<void> recordPayment(Payment payment) async {
    final repository = ref.read(financialRepositoryProvider);
    await repository.recordPayment(payment);
    ref.invalidateSelf();
  }
}
