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
    return Card(
      color: AppColors.card,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.deepPurple,
          child: Text(
            workout.category.substring(0, 1),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          workout.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          "${workout.duration} min • ${workout.calories} kcal • ${workout.level}",
          style: const TextStyle(color: Colors.white70),
        ),
      ),
    );
  }
}