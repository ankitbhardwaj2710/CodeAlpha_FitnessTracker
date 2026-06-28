import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../models/bmi_model.dart';

class BMIResultCard extends StatelessWidget {
  final BMIModel result;

  const BMIResultCard({
    super.key,
    required this.result,
  });

  Color getResultColor() {
    if (result.bmi < 18.5) {
      return Colors.blue;
    } else if (result.bmi < 25) {
      return Colors.green;
    } else if (result.bmi < 30) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  String getHealthMessage() {
    if (result.bmi < 18.5) {
      return "You are underweight.\nEat a healthy balanced diet.";
    } else if (result.bmi < 25) {
      return "Excellent!\nYour BMI is in the healthy range.";
    } else if (result.bmi < 30) {
      return "Try regular exercise\nand maintain your diet.";
    } else {
      return "Health Risk!\nConsult a doctor and start fitness goals.";
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = getResultColor();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(
            Icons.favorite,
            size: 60,
            color: color,
          ),

          const SizedBox(height: 20),

          Text(
            result.bmi.toStringAsFixed(2),
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            result.category,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),

          const SizedBox(height: 20),

          LinearProgressIndicator(
            value: (result.bmi / 40).clamp(0.0, 1.0),
            minHeight: 10,
            borderRadius: BorderRadius.circular(20),
            valueColor: AlwaysStoppedAnimation(color),
          ),

          const SizedBox(height: 20),

          Text(
            getHealthMessage(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}