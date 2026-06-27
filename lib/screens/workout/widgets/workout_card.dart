import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../models/workout_model.dart';

class WorkoutCard extends StatelessWidget {
  final WorkoutModel workout;

  const WorkoutCard({
    super.key,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),

      child: ListTile(
        contentPadding: const EdgeInsets.all(18),

        leading: Text(
          workout.icon,
          style: const TextStyle(fontSize: 32),
        ),

        title: Text(
          workout.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "${workout.duration} • ${workout.calories} kcal • ${workout.level}",
            style: const TextStyle(
              color: Colors.white70,
            ),
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
          size: 18,
        ),
      ),
    );
  }
}