import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/workout_model.dart';
import 'widgets/workout_card.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Workout"),
        centerTitle: true,
      ),

      body: ListView.builder(
        padding: const EdgeInsets.all(20),

        itemCount: workoutList.length,

        itemBuilder: (context, index) {
          return WorkoutCard(
            workout: workoutList[index],
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Next Sprint
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}