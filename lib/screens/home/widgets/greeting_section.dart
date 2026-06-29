import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/constants/app_colors.dart';

class GreetingSection extends StatelessWidget {
  const GreetingSection({super.key});

  String getGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return "Good Morning";
    } else if (hour < 17) {
      return "Good Afternoon";
    } else if (hour < 21) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  @override
  Widget build(BuildContext context) {
    final today = DateFormat("EEEE, dd MMM yyyy").format(DateTime.now());

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getGreeting(),
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "Ankit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                today,
                style: const TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),

              const SizedBox(height: 4),

              const Text(
                "Ready to crush today's goals?",
                style: TextStyle(
                  color: AppColors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),

        const CircleAvatar(
          radius: 28,
          backgroundColor: AppColors.primary,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 30,
          ),
        ),
      ],
    );
  }
}