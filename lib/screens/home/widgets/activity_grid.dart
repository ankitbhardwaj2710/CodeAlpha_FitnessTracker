import 'package:flutter/material.dart';

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
      children: const [
        InfoCard(
          title: "Steps",
          value: "8,240",
          icon: Icons.directions_walk,
          color: Colors.deepPurple,
        ),
        InfoCard(
          title: "Calories",
          value: "620",
          icon: Icons.local_fire_department,
          color: Colors.orange,
        ),
        InfoCard(
          title: "Water",
          value: "2.5 L",
          icon: Icons.water_drop,
          color: Colors.cyan,
        ),
        InfoCard(
          title: "Workout",
          value: "55 Min",
          icon: Icons.fitness_center,
          color: Colors.green,
        ),
      ],
    );
  }
}