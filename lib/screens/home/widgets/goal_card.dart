import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class GoalCard extends StatelessWidget {
  final int totalCalories;
  final int totalDuration;
  final int workoutCount;

  const GoalCard({
    super.key,
    required this.totalCalories,
    required this.totalDuration,
    required this.workoutCount,
  });

  @override
  Widget build(BuildContext context) {
    double progress = totalCalories / 2000;

    if (progress > 1) {
      progress = 1;
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          const Text(
            "Today's Fitness",
            style: TextStyle(
              color: AppColors.grey,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "$totalCalories kcal",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 38,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            borderRadius: BorderRadius.circular(20),
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              _StatItem(
                title: "Workout",
                value: "$workoutCount",
              ),

              _StatItem(
                title: "Minutes",
                value: "$totalDuration",
              ),

            ],
          )
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;

  const _StatItem({
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          title,
          style: const TextStyle(
            color: AppColors.grey,
          ),
        ),

      ],
    );
  }
}