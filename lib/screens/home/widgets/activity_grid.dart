import 'package:flutter/material.dart';

import '../../../widgets/info_card.dart';

class ActivityGrid extends StatelessWidget {
  final int workoutCount;
  final int calories;
  final int duration;

  const ActivityGrid({
    super.key,
    required this.workoutCount,
    required this.calories,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      childAspectRatio: 1.15,
      children: [
        InfoCard(
          title: "Workouts",
          value: workoutCount.toString(),
          icon: Icons.fitness_center,
          color: Colors.deepPurple,
        ),

        InfoCard(
          title: "Calories",
          value: "$calories kcal",
          icon: Icons.local_fire_department,
          color: Colors.orange,
        ),

        InfoCard(
          title: "Duration",
          value: "$duration min",
          icon: Icons.timer,
          color: Colors.cyan,
        ),

        const InfoCard(
          title: "Goal",
          value: "Keep Going 💪",
          icon: Icons.emoji_events,
          color: Colors.green,
        ),
      ],
    );
  }
}