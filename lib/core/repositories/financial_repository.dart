import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/models.dart';
import '../network/api_client.dart';

part 'financial_repository.g.dart';

class FinancialRepository {
  final Dio _dio;

  FinancialRepository(this._dio);

  Future<void> recordPayment(Payment payment) async {
    await _dio.post('/api/doctors/payments', data: payment.toJson());
  }

  Future<List<Payment>> getPayments() async {
    final response = await _dio.get('/api/doctors/payments');
    final data = response.data as List;
    return data.map((e) => Payment.fromJson(e)).toList();
  }

  Future<RevenueData> getRevenue() async {
    final response = await _dio.get('/api/doctors/revenue');
    return RevenueData.fromJson(response.data);
  }
}

@riverpod
FinancialRepository financialRepository(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return FinancialRepository(dio);
}
