import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/models.dart';
import '../network/api_client.dart';

part 'financial_repository.g.dart';

/// The [FinancialRepository] handles all accounting and revenue-related operations.
///
/// It allows doctors to track their earnings, record direct patient payments,
/// and retrieve analytical data for financial reporting.
class FinancialRepository {
  /// The HTTP client used for network requests.
  final Dio _dio;

  /// Constructs a [FinancialRepository] with the provided Dio instance.
  /// 
  /// @param _dio The Dio instance configured with the API base URL and interceptors.
  FinancialRepository(this._dio);

  /// Submits a new payment record to the backend.
  ///
  /// This is typically used to log cash transactions performed in-clinic.
  /// 
  /// @param payment The [Payment] model containing patient ID, amount, and appointment context.
  /// @return A [Future] that completes when the payment is successfully recorded.
  /// @throws [DioException] if the network request fails or the server returns an error.
  Future<void> recordPayment(Payment payment) async {
    await _dio.post('/api/doctors/payments', data: payment.toJson());
  }

  /// Retrieves a history of all payment transactions recorded by the doctor.
  /// 
  /// @return A [Future] resolving to a [List] of [Payment] objects.
  /// @throws [DioException] if the server cannot be reached or returns a non-200 status.
  Future<List<Payment>> getPayments() async {
    final response = await _dio.get('/api/doctors/payments');
    final data = response.data as List;
    return data.map((e) => Payment.fromJson(e)).toList();
  }

  /// Fetches aggregated revenue metrics for the authenticated doctor.
  ///
  /// Includes total earnings and daily performance data for charting.
  /// 
  /// @return A [Future] resolving to a [RevenueData] object containing totals and breakdown.
  /// @throws [DioException] if the revenue data cannot be retrieved.
  Future<RevenueData> getRevenue() async {
    final response = await _dio.get('/api/doctors/revenue');
    return RevenueData.fromJson(response.data);
  }
}

/// Provider for the [FinancialRepository].
/// 
/// @param ref The Riverpod [Ref] used to watch the API client provider.
/// @return A configured [FinancialRepository] instance.
@riverpod
FinancialRepository financialRepository(Ref ref) {
  final dio = ref.watch(apiClientProvider);
  return FinancialRepository(dio);
}
