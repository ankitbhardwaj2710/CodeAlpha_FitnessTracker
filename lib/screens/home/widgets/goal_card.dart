import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: const [
          Text(
            "Today's Goal",
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          Text(
            "78%",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          LinearProgressIndicator(
            value: .78,
            minHeight: 8,
            backgroundColor: Colors.black26,
          ),
          SizedBox(height: 12),
          Text(
            "620 / 800 Calories",
            style: TextStyle(
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}