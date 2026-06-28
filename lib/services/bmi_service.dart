import '../models/bmi_model.dart';

class BMIService {
  BMIModel calculateBMI({
    required double heightCm,
    required double weightKg,
  }) {
    final heightMeter = heightCm / 100;

    final bmi = weightKg / (heightMeter * heightMeter);

    String category;

    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi < 25) {
      category = "Normal";
    } else if (bmi < 30) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    return BMIModel(
      height: heightCm,
      weight: weightKg,
      bmi: bmi,
      category: category,
    );
  }
}