import 'package:flutter/material.dart';

import '../../../models/dashboard_model.dart';
import '../../../widgets/info_card.dart';

class ActivityGrid extends StatelessWidget {
  const ActivityGrid({super.key});

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
          title: "Steps",
          value: dashboardData.steps.toString(),
          icon: Icons.directions_walk,
          color: Colors.deepPurple,
        ),

        InfoCard(
          title: "Calories",
          value: dashboardData.calories.toString(),
          icon: Icons.local_fire_department,
          color: Colors.orange,
        ),

        InfoCard(
          title: "Water",
          value: "${dashboardData.water} L",
          icon: Icons.water_drop,
          color: Colors.cyan,
        ),

        InfoCard(
          title: "Workout",
          value: "${dashboardData.workoutMinutes} Min",
          icon: Icons.fitness_center,
          color: Colors.green,
        ),

      ],
    );
  }
}