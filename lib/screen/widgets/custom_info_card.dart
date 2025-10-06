import 'package:flutter/material.dart';
import 'package:taskgameproject/util/colorconstraint.dart';

class CustomInfoCard extends StatelessWidget {
  final IconData icon;
  final String time;
  final String title;
  final String description;

  const CustomInfoCard({
    Key? key,
    required this.icon,
    required this.time,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xffA6A6A6),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 30, color: ColorConstraint.whiteTextColor),
          const SizedBox(height: 8),
          Text(
            time,
            style: TextStyle(
              fontSize: 14,
              color: ColorConstraint.whiteTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: ColorConstraint.whiteTextColor,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: ColorConstraint.whiteTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
