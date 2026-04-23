import 'package:flutter/material.dart';

class ReviewData {
  final String patientName;
  final String initials;
  final Color avatarColor;
  final String dateAndType;
  final int rating;
  final String reviewText;
  final bool hasLeftBorder;

  ReviewData({
    required this.patientName,
    required this.initials,
    required this.avatarColor,
    required this.dateAndType,
    required this.rating,
    required this.reviewText,
    this.hasLeftBorder = false,
  });
}

class PatientReviewsWidget extends StatefulWidget {
  const PatientReviewsWidget({super.key});

  @override
  State<PatientReviewsWidget> createState() => _PatientReviewsWidgetState();
}

class _PatientReviewsWidgetState extends State<PatientReviewsWidget> {
  String _selectedFilter = 'Newest First';
  final List<String> _filterOptions = [
    'Newest First',
    'Oldest First',
    'Highest Rated',
    'Lowest Rated',
  ];

  @override
  Widget build(BuildContext context) {
    final List<ReviewData> reviews = [
      ReviewData(
        patientName: "Eleanor Richards",
        initials: "ER",
        avatarColor: const Color(0xFF4FC3F7),
        dateAndType: "Oct 24, 2023 • General Checkup",
        rating: 5,
        reviewText: "\"Dr. Smith was incredibly thorough during my annual physical. She took the time to explain my lab results in a way that was easy to understand, rather than just rushing through the appointment. Very professional and helpful.\"",
      ),
      ReviewData(
        patientName: "Michael Jenkins",
        initials: "MJ",
        avatarColor: const Color(0xFFC05A3E),
        dateAndType: "Oct 18, 2023 • Follow-up",
        rating: 4,
        reviewText: "\"Good experience overall. The wait time was a bit longer than expected (about 20 minutes past my appointment time), but once I was in the room, the care was excellent. The new facility is very clean.\"",
      ),
      ReviewData(
        patientName: "Sarah Wong",
        initials: "SW",
        avatarColor: const Color(0xFF006D60),
        dateAndType: "Oct 12, 2023 • Consultation",
        rating: 5,
        reviewText: "\"I appreciate the digital portal for accessing my notes beforehand. Dr. Smith was attentive and addressed all my concerns regarding the new medication. Best clinical experience I've had in years.\"",
        hasLeftBorder: true,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Patient Reviews",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F4F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedFilter,
                      icon: const Icon(Icons.keyboard_arrow_down, size: 16, color: Colors.black),
                      elevation: 0,
                      dropdownColor: Colors.white,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          setState(() {
                            _selectedFilter = newValue;
                          });
                        }
                      },
                      items: _filterOptions.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F4F5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.filter_list, size: 20, color: Colors.black),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        ...reviews.map((review) => _buildReviewCard(review)),
      ],
    );
  }

  Widget _buildReviewCard(ReviewData review) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.hardEdge,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (review.hasLeftBorder)
              Container(width: 4, color: const Color(0xFF006D60)),
            Expanded(
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
                              backgroundColor: review.avatarColor,
                              child: Text(
                                review.initials,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  review.patientName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  review.dateAndType,
                                  style: const TextStyle(
                                    color: Color(0XFF5a6362),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: List.generate(5, (index) {
                            return Icon(
                              index < review.rating ? Icons.star : Icons.star_border,
                              color: const Color(0xFFC05A3E),
                              size: 20,
                            );
                          }),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      review.reviewText,
                      style: const TextStyle(
                        color: Color(0XFF3d4947),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: const Color(0xFF006D60),
                        padding: EdgeInsets.zero,
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        "Reply to ${review.patientName.split(' ')[0]}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
