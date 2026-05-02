import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/financials_view_model.dart';
import '../../../../core/utils/error_handler.dart';

/// The [RecentTransactionsWidget] provides a tabular view of the most recent 
/// financial activities.
///
/// It displays patient identifiers, transaction dates, and confirmed amounts, 
/// allowing the doctor to audit manual cash payments at a glance.
class RecentTransactionsWidget extends ConsumerWidget {
  const RecentTransactionsWidget({super.key});

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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "RECENT TRANSACTIONS",
                style: TextStyle(
                  color: Color(0XFF5a6362),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          financialsState.when(
            loading: () => const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: CircularProgressIndicator(color: Color(0xFF006D60))),
            ),
            error: (err, _) => Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Text(
                  ErrorHandler.getMessage(err),
                  style: const TextStyle(color: Color(0xFF5a6362)),
                ),
              ),
            ),
            data: (data) {
              final payments = data.payments;
              if (payments.isEmpty) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 24),
                  child: Center(
                    child: Text(
                      'No transactions recorded yet.',
                      style: TextStyle(color: Color(0xFF5a6362), fontSize: 15),
                    ),
                  ),
                );
              }

              return LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minWidth: constraints.maxWidth),
                      child: Theme(
                        data: Theme.of(context).copyWith(dividerColor: const Color(0XFFF1F4F5)),
                        child: DataTable(
                          horizontalMargin: 0,
                          columnSpacing: 40,
                          headingRowHeight: 48,
                          dataRowMinHeight: 72,
                          dataRowMaxHeight: 72,
                          headingTextStyle: const TextStyle(
                            color: Color(0XFF5a6362),
                            fontSize: 12,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                          columns: const [
                            DataColumn(label: Text("PATIENT")),
                            DataColumn(label: Text("DATE")),
                            DataColumn(label: Text("AMOUNT")),
                            DataColumn(label: Text("STATUS")),
                          ],
                          rows: payments.take(10).map((payment) {
                            // Extract initials from the patient ID for the avatar.
                            final initials = payment.patientId.isNotEmpty
                                ? payment.patientId.substring(0, 2).toUpperCase()
                                : "??";
                            
                            return DataRow(
                              cells: [
                                DataCell(
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor: const Color(0xFFF4F6F8),
                                        child: Text(
                                          initials,
                                          style: const TextStyle(
                                            color: Color(0XFF3d4947),
                                            fontWeight: FontWeight.w700,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        payment.patientId.length > 14
                                            ? '${payment.patientId.substring(0, 14)}...'
                                            : payment.patientId,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    payment.date ?? '-',
                                    style: const TextStyle(
                                      color: Color(0XFF5a6362),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    "\$${(payment.amount ?? 0).toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                DataCell(
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFF1F4F5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 6,
                                          height: 6,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF5ED3C6),
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        const Text(
                                          "Confirmed",
                                          style: TextStyle(
                                            color: Color(0XFF5a6362),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
