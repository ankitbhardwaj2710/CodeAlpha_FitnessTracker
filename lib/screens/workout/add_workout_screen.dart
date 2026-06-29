import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import 'widgets/workout_dropdown.dart';
import 'widgets/workout_textfield.dart';
import '../../models/workout_model.dart';
import '../../services/workout_service.dart';

class AddWorkoutScreen extends StatefulWidget {
  const AddWorkoutScreen({super.key});

  @override
  State<AddWorkoutScreen> createState() => _AddWorkoutScreenState();
}

class _AddWorkoutScreenState extends State<AddWorkoutScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();

  String category = "Chest";
  String level = "Beginner";

  @override
  void dispose() {
    nameController.dispose();
    durationController.dispose();
    caloriesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text("Add Workout"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WorkoutTextField(label: "Workout Name", controller: nameController),

            const SizedBox(height: 20),

            WorkoutDropdown(
              label: "Category",
              value: category,
              items: const [
                "Chest",
                "Cardio",
                "Legs",
                "Yoga",
                "Shoulders",
                "Back",
              ],
              onChanged: (value) {
                setState(() {
                  category = value!;
                });
              },
            ),

            const SizedBox(height: 20),

            WorkoutTextField(
              label: "Duration (Minutes)",
              controller: durationController,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            WorkoutTextField(
              label: "Calories",
              controller: caloriesController,
              keyboardType: TextInputType.number,
            ),

            const SizedBox(height: 20),

            WorkoutDropdown(
              label: "Level",
              value: level,
              items: const ["Beginner", "Intermediate", "Advanced"],
              onChanged: (value) {
                setState(() {
                  level = value!;
                });
              },
            ),

            const SizedBox(height: 35),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                onPressed: () async {
                  if (nameController.text.trim().isEmpty ||
                      durationController.text.trim().isEmpty ||
                      caloriesController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please fill all fields")),
                    );

                    return;
                  }

                  final workout = WorkoutModel(
                    title: nameController.text.trim(),
                    category: category,
                    duration: int.parse(durationController.text),
                    calories: int.parse(caloriesController.text),
                    level: level,
                  );

                  await WorkoutService().insertWorkout(workout);

                  if (!context.mounted) return;

                  Navigator.pop(context, true);
                },

                child: const Text(
                  "SAVE WORKOUT",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
