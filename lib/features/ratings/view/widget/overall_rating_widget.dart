import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/ratings_view_model.dart';
import '../../../../core/utils/error_handler.dart';

/// [OverallRatingWidget] visualizes the doctor's collective patient satisfaction 
/// metrics.
///
/// It displays the mean rating score and provides a categorical breakdown of 
/// the star distribution (1-5), allowing the doctor to identify trends in 
/// patient feedback.
class OverallRatingWidget extends ConsumerWidget {
  /// Constructs an [OverallRatingWidget].
  /// 
  /// @param key The widget key.
  const OverallRatingWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratingsState = ref.watch(ratingsViewModelProvider);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ratingsState.when(
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
                TextButton(onPressed: () => ref.invalidate(ratingsViewModelProvider), child: const Text('Retry')),
              ],
            ),
          ),
        ),
        data: (data) {
          final avg = data.averageRating ?? 0.0;
          final backendTotal = data.totalRatings ?? 0;
          final ratings = data.ratings ?? [];

          // Count distribution
          Map<int, int> dist = {5: 0, 4: 0, 3: 0, 2: 0, 1: 0};
          int localTotal = 0;
          for (final r in ratings) {
            dist[r.stars] = (dist[r.stars] ?? 0) + 1;
            localTotal++;
          }
          final total = localTotal > backendTotal ? localTotal : backendTotal;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "OVERALL RATING",
                style: TextStyle(color: Color(0XFF5a6362), fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.5),
              ),
              const SizedBox(height: 24),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                runSpacing: 8,
                children: [
                  Text(
                    avg.toStringAsFixed(1),
                    style: const TextStyle(color: Colors.black, fontSize: 64, fontWeight: FontWeight.w800, height: 1.0, letterSpacing: -2),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) {
                      if (index < avg.floor()) {
                        return const Icon(Icons.star, color: Color(0xFFC05A3E), size: 24);
                      } else if (index < avg) {
                        return const Icon(Icons.star_half, color: Color(0xFFC05A3E), size: 24);
                      }
                      return const Icon(Icons.star_border, color: Color(0xFFC05A3E), size: 24);
                    }),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "Based on $total total reviews.",
                style: const TextStyle(color: Color(0XFF5a6362), fontSize: 15, fontWeight: FontWeight.w500, height: 1.4),
              ),
              const SizedBox(height: 32),
              ...dist.entries.map((entry) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildRatingBar(
                    "${entry.key} Star",
                    entry.value,
                    total > 0 ? total : 1,
                    entry.key >= 4 ? const Color(0xFF006D60) : entry.key == 3 ? const Color(0xFF64B5F6) : const Color(0xFFE57373),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }

  /// Constructs a horizontal progress bar for a specific star rating category.
  /// 
  /// @param label The category label (e.g., "5 Star").
  /// @param count Number of reviews in this category.
  /// @param total Total number of reviews.
  /// @param color The visual color for the progress bar.
  /// @return A configured [Widget].
  Widget _buildRatingBar(String label, int count, int total, Color color) {
    final double percentage = (total > 0 ? (count / total) : 0.0).clamp(0.0, 1.0);
    return Row(
      children: [
        SizedBox(width: 50, child: Text(label, style: const TextStyle(color: Color(0XFF5a6362), fontSize: 14, fontWeight: FontWeight.w500))),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 8,
            decoration: BoxDecoration(color: const Color(0xFFF1F4F5), borderRadius: BorderRadius.circular(4)),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4))),
            ),
          ),
        ),
        const SizedBox(width: 16),
        SizedBox(width: 30, child: Text(count.toString(), textAlign: TextAlign.right, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w600))),
      ],
    );
  }
}
