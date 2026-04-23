import 'package:flutter/material.dart';

class TransactionData {
  final String name;
  final String initials;
  final String date;
  final String amount;
  final String status;

  TransactionData({
    required this.name,
    required this.initials,
    required this.date,
    required this.amount,
    required this.status,
  });
}

class RecentTransactionsWidget extends StatelessWidget {
  const RecentTransactionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TransactionData> transactions = [
      TransactionData(
        name: "Eleanor Hayes",
        initials: "EH",
        date: "Oct 24, 2023",
        amount: "\$450.00",
        status: "Confirmed",
      ),
      TransactionData(
        name: "Marcus Rivera",
        initials: "MR",
        date: "Oct 24, 2023",
        amount: "\$1,200.00",
        status: "Confirmed",
      ),
    ];

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "RECENT TRANSACTIONS",
                style: TextStyle(
                  color: Color(0XFF5a6362),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.2,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF006D60),
                ),
                child: const Text('View All', style: TextStyle(fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth: constraints.maxWidth),
                  child: Theme(
                    data: Theme.of(context).copyWith(
                      dividerColor: const Color(0XFFF1F4F5),
                    ),
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
                      rows: transactions.map((data) => _buildRow(data)).toList(),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  DataRow _buildRow(TransactionData data) {
    return DataRow(
      cells: [
        DataCell(
          Row(
            children: [
              CircleAvatar(
                radius: 18,
                backgroundColor: const Color(0xFFF4F6F8),
                child: Text(
                  data.initials,
                  style: const TextStyle(
                    color: Color(0XFF3d4947),
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                data.name,
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
            data.date,
            style: const TextStyle(
              color: Color(0XFF5a6362),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        DataCell(
          Text(
            data.amount,
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
                    color: Color(0xFF5ED3C6), // Cyan dot
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 6),
                Text(
                  data.status,
                  style: const TextStyle(
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
  }
}
