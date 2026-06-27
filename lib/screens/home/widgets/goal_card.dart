import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../models/dashboard_model.dart';

class GoalCard extends StatelessWidget {
  const GoalCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(

      width: double.infinity,

      padding: const EdgeInsets.all(22),

      decoration: BoxDecoration(

        color: AppColors.card,

        borderRadius: BorderRadius.circular(25),

      ),

      child: Column(

        children: [

          const Text(

            "Today's Goal",

            style: TextStyle(

              color: AppColors.grey,

              fontSize:16,

            ),

          ),

          const SizedBox(height:12),

          Text(

            "${(dashboardData.goalPercent*100).toInt()}%",

            style: const TextStyle(

              color: Colors.white,

              fontSize:42,

              fontWeight: FontWeight.bold,

            ),

          ),

          const SizedBox(height:12),

          LinearProgressIndicator(

            value: dashboardData.goalPercent,

            minHeight:8,

          ),

          const SizedBox(height:12),

          Text(

            "${dashboardData.calories} / 800 Calories",

            style: const TextStyle(

              color: AppColors.grey,

            ),

          ),

        ],

      ),

    );

  }

}