import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/workout_model.dart';
import '../../services/workout_service.dart';
import 'add_workout_screen.dart';
import 'widgets/workout_card.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {

  final WorkoutService service = WorkoutService();

  List<WorkoutModel> workouts = [];

  @override
  void initState() {
    super.initState();
    loadWorkouts();
  }

  Future<void> loadWorkouts() async {
    workouts = await service.getWorkouts();
    setState(() {});
  }

  Future<void> deleteWorkout(int id) async {
    await service.deleteWorkout(id);
    loadWorkouts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("Workout"),
        centerTitle: true,
      ),

      body: workouts.isEmpty
          ? const Center(
              child: Text(
                "No workouts yet",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            )
          : RefreshIndicator(
              onRefresh: loadWorkouts,
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: workouts.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onLongPress: () async {
                      await deleteWorkout(workouts[index].id!);
                    },
                    child: WorkoutCard(
                      workout: workouts[index],
                    ),
                  );
                },
              ),
            ),

      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text("Add Workout"),
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddWorkoutScreen(),
            ),
          );

          loadWorkouts();
        },
      ),
    );
  }
}