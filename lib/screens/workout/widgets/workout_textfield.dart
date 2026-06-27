import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';

class WorkoutTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const WorkoutTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(color: Colors.white),

          decoration: InputDecoration(
            hintText: "Enter $label",

            hintStyle: const TextStyle(
              color: Colors.white54,
            ),

            filled: true,
            fillColor: AppColors.card,

            contentPadding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 16,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}