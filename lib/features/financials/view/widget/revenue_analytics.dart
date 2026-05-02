import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../view_model/financials_view_model.dart';
import '../../../../core/utils/error_handler.dart';

/// [RevenueAnalyticsWidget] provides a high-fidelity visualization of clinical 
/// earnings over time.
///
/// It aggregates transactional data from the backend to display a total 
/// revenue summary and a historical performance line chart.
class RevenueAnalyticsWidget extends ConsumerWidget {
  /// Constructs a [RevenueAnalyticsWidget].
  /// 
  /// @param key The widget key.
  const RevenueAnalyticsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final financialsState = ref.watch(financialsViewModelProvider);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(32),
      child: financialsState.when(
        loading: () => const SizedBox(
          height: 200,
          child: Center(child: CircularProgressIndicator(color: Color(0xFF006D60))),
        ),
        error: (err, _) => SizedBox(
          height: 200,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(ErrorHandler.getMessage(err), style: const TextStyle(color: Color(0xFF5a6362))),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => ref.invalidate(financialsViewModelProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
        data: (data) {
          final revenue = data.revenue;
          final breakdown = revenue.dailyBreakdown ?? [];
          // Build chart spots
          List<FlSpot> spots = [];
          double maxY = 1;
          for (int i = 0; i < breakdown.length; i++) {
            final t = breakdown[i].total ?? 0.0;
            spots.add(FlSpot(i.toDouble(), t));
            if (t > maxY) maxY = t;
          }
          if (spots.isEmpty) {
            spots = [const FlSpot(0, 0), const FlSpot(1, 0)];
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 6, height: 6,
                              decoration: const BoxDecoration(color: Color(0xFF006B95), shape: BoxShape.circle),
                            ),
                            const SizedBox(width: 8),
                            const Flexible(
                              child: Text(
                                "REVENUE ANALYTICS",
                                style: TextStyle(color: Color(0XFF5a6362), fontSize: 12, fontWeight: FontWeight.w700, letterSpacing: 1.2),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "\$${(revenue.totalEarnings ?? 0).toStringAsFixed(0)}",
                                style: const TextStyle(color: Colors.black, fontSize: 42, fontWeight: FontWeight.w700, fontFamily: 'Inter'),
                              ),
                              const TextSpan(
                                text: ".00",
                                style: TextStyle(color: Color(0XFF8e9998), fontSize: 28, fontWeight: FontWeight.w600, fontFamily: 'Inter'),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "${revenue.totalPayments} payments recorded",
                          style: const TextStyle(color: Color(0XFF5a6362), fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              SizedBox(
                height: 120,
                width: double.infinity,
                child: LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: const FlTitlesData(show: false),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: (spots.length - 1).toDouble().clamp(1, double.infinity),
                    minY: 0,
                    maxY: maxY * 1.2,
                    lineBarsData: [
                      LineChartBarData(
                        spots: spots,
                        isCurved: true,
                        color: const Color(0xFF006D60),
                        barWidth: 6,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          checkToShowDot: (spot, barData) => spot == spots.last,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 5,
                              color: Colors.white,
                              strokeWidth: 2.5,
                              strokeColor: const Color(0xFF006D60),
                            );
                          },
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF006D60).withValues(alpha: 0.15),
                              const Color(0xFF006D60).withValues(alpha: 0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                    lineTouchData: const LineTouchData(enabled: false),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
