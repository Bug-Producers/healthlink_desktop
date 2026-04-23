import 'package:flutter/material.dart';

class OverallRatingWidget extends StatelessWidget {
  const OverallRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "OVERALL RATING",
            style: TextStyle(
              color: Color(0XFF5a6362),
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 8,
            children: [
              const Text(
                "4.8",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 64,
                  fontWeight: FontWeight.w800,
                  height: 1.0,
                  letterSpacing: -2,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(5, (index) {
                  return Icon(
                    index < 4 ? Icons.star : Icons.star_half,
                    color: const Color(0xFFC05A3E),
                    size: 24,
                  );
                }),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            "Based on 120 total reviews this\nyear.",
            style: TextStyle(
              color: Color(0XFF5a6362),
              fontSize: 15,
              fontWeight: FontWeight.w500,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 32),
          _buildRatingBar("5 Star", 102, 120, const Color(0xFF006D60)),
          const SizedBox(height: 16),
          _buildRatingBar("4 Star", 12, 120, const Color(0xFF006D60)),
          const SizedBox(height: 16),
          _buildRatingBar("3 Star", 4, 120, const Color(0xFF64B5F6)),
          const SizedBox(height: 16),
          _buildRatingBar("2 Star", 1, 120, const Color(0xFFE57373)),
          const SizedBox(height: 16),
          _buildRatingBar("1 Star", 1, 120, const Color(0xFFE57373)),
        ],
      ),
    );
  }

  Widget _buildRatingBar(String label, int count, int total, Color color) {
    final double percentage = count / total;
    
    return Row(
      children: [
        SizedBox(
          width: 50,
          child: Text(
            label,
            style: const TextStyle(
              color: Color(0XFF5a6362),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F4F5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(
          width: 30,
          child: Text(
            count.toString(),
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
