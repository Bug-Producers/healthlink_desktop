import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../view_model/ratings_view_model.dart';
import '../../../../core/utils/error_handler.dart';

/// [PatientReviewsWidget] provides a paginated and sortable feed of detailed 
/// patient feedback.
///
/// It allows the doctor to browse qualitative comments alongside star 
/// ratings, with filtering options for chronological or performance-based sorting.
class PatientReviewsWidget extends ConsumerStatefulWidget {
  /// Constructs a [PatientReviewsWidget].
  /// 
  /// @param key The widget key.
  const PatientReviewsWidget({super.key});

  @override
  ConsumerState<PatientReviewsWidget> createState() => _PatientReviewsWidgetState();
}

class _PatientReviewsWidgetState extends ConsumerState<PatientReviewsWidget> {
  String _selectedFilter = 'Newest First';
  final List<String> _filterOptions = ['Newest First', 'Oldest First', 'Highest Rated', 'Lowest Rated'];

  final List<Color> _avatarColors = [
    const Color(0xFF4FC3F7), const Color(0xFFC05A3E), const Color(0xFF006D60),
    const Color(0xFF9C27B0), const Color(0xFF5B9BD5), const Color(0xFFE65100),
  ];

  @override
  Widget build(BuildContext context) {
    final ratingsState = ref.watch(ratingsViewModelProvider);

    return ratingsState.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(24),
        child: Center(child: CircularProgressIndicator(color: Color(0xFF006D60))),
      ),
      error: (err, _) => Center(child: Text(ErrorHandler.getMessage(err))),
      data: (data) {
        var reviews = List.of(data.ratings ?? []);

        // Sort based on filter
        switch (_selectedFilter) {
          case 'Newest First':
            reviews.sort((a, b) => (b.date ?? '').compareTo(a.date ?? ''));
            break;
          case 'Oldest First':
            reviews.sort((a, b) => (a.date ?? '').compareTo(b.date ?? ''));
            break;
          case 'Highest Rated':
            reviews.sort((a, b) => b.stars.compareTo(a.stars));
            break;
          case 'Lowest Rated':
            reviews.sort((a, b) => a.stars.compareTo(b.stars));
            break;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Patient Reviews", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700)),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(color: const Color(0xFFF1F4F5), borderRadius: BorderRadius.circular(8)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedFilter,
                      icon: const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black),
                      elevation: 0, dropdownColor: Colors.white,
                      style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                      onChanged: (String? newValue) {
                        if (newValue != null) setState(() => _selectedFilter = newValue);
                      },
                      items: _filterOptions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(value: value, child: Text(value));
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            if (reviews.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: Center(child: Text('No reviews yet', style: TextStyle(color: Color(0xFF5a6362), fontSize: 15))),
              )
            else
              ...reviews.take(10).toList().asMap().entries.map((entry) {
                final index = entry.key;
                final review = entry.value;
                final name = review.patientName ?? 'Anonymous';
                final initials = name.isNotEmpty
                    ? name.split(' ').map((w) => w.isNotEmpty ? w[0] : '').join().toUpperCase()
                    : '?';
                final avatarColor = _avatarColors[index % _avatarColors.length];

                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                  clipBehavior: Clip.hardEdge,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: avatarColor,
                                  child: Text(initials, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)),
                                ),
                                const SizedBox(width: 16),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(name, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w700)),
                                    Text(review.date ?? '', style: const TextStyle(color: Color(0XFF5a6362), fontSize: 13, fontWeight: FontWeight.w500)),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: List.generate(5, (i) {
                                return Icon(
                                  i < review.stars ? Icons.star : Icons.star_border,
                                  color: const Color(0xFFC05A3E), size: 20,
                                );
                              }),
                            ),
                          ],
                        ),
                        if (review.comment != null && review.comment!.isNotEmpty) ...[
                          const SizedBox(height: 20),
                          Text(
                            '"${review.comment!}"',
                            style: const TextStyle(color: Color(0XFF3d4947), fontSize: 15, fontWeight: FontWeight.w500, height: 1.5),
                          ),
                        ],
                      ],
                    ),
                  ),
                );
              }),
          ],
        );
      },
    );
  }
}
