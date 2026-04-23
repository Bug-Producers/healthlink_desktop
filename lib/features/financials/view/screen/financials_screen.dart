import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/app_bar_widget.dart';
import '../widget/financials_header.dart';
import '../widget/revenue_analytics.dart';
import '../widget/recent_transactions.dart';
import '../widget/record_cash_payment.dart';

class FinancialsScreen extends StatelessWidget {
  const FinancialsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > 800;
          final paddingValue = constraints.maxWidth < 800 ? 16.0 : 40.0;
          final headerSpacing = constraints.maxWidth < 800 ? 24.0 : 45.0;
          final bodySpacing = constraints.maxWidth < 800 ? 16.0 : 31.0;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1440),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarWidget(),
                    SizedBox(height: headerSpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: const FinancialsHeaderWidget(),
                    ),
                    SizedBox(height: bodySpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: ResponsiveRowColumn(
                        layout: isDesktop ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
                        rowCrossAxisAlignment: CrossAxisAlignment.start,
                        rowSpacing: 30,
                        columnSpacing: 20,
                        children: [
                          ResponsiveRowColumnItem(
                            rowFlex: 6,
                            child: Column(
                              children: const [
                                RevenueAnalyticsWidget(),
                                SizedBox(height: 24),
                                RecentTransactionsWidget(),
                              ],
                            ),
                          ),
                          const ResponsiveRowColumnItem(
                            rowFlex: 4,
                            child: RecordCashPaymentWidget(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
