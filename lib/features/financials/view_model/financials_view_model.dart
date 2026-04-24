import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/financial_repository.dart';

part 'financials_view_model.g.dart';

@riverpod
class FinancialsViewModel extends _$FinancialsViewModel {
  @override
  Future<RevenueData> build() async {
    final repository = ref.watch(financialRepositoryProvider);
    return await repository.getRevenue();
  }

  Future<void> recordPayment(Payment payment) async {
    final repository = ref.read(financialRepositoryProvider);
    await repository.recordPayment(payment);
    ref.invalidateSelf();
  }

  Future<List<Payment>> getPayments() async {
    final repository = ref.read(financialRepositoryProvider);
    return await repository.getPayments();
  }
}
