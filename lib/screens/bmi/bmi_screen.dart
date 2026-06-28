import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../services/bmi_service.dart';
import '../../models/bmi_model.dart';
import '../../widgets/custom_button.dart';
import 'widgets/bmi_result_card.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final BMIService service = BMIService();

  BMIModel? result;

  void calculateBMI() {
    if (heightController.text.isEmpty || weightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please enter height and weight")),
      );
      return;
    }

    final height = double.parse(heightController.text);
    final weight = double.parse(weightController.text);

    setState(() {
      result = service.calculateBMI(heightCm: height, weightKg: weight);
    });
  }

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(title: const Text("BMI Calculator"), centerTitle: true),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Height (cm)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Weight (kg)",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 30),

            CustomButton(text: "Calculate BMI", onPressed: calculateBMI),

            const SizedBox(height: 35),

            if (result != null) BMIResultCard(result: result!),
          ],
        ),
      ),
    );
  }
}
