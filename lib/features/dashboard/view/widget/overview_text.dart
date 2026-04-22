import 'package:flutter/material.dart';

class OverViewText extends StatelessWidget {
  const OverViewText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          "Overview",
          style: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.w800,
          ),
        ),
        Text(
          "Tuesday, oct24",
          style: TextStyle(
            color: Color(0XFF3d4947),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}