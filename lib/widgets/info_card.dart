import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';

class InfoCard extends StatelessWidget {

  final String title;
  final String value;
  final IconData icon;

  const InfoCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: AppColors.card,

        borderRadius: BorderRadius.circular(22),

      ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          Icon(
            icon,
            color: AppColors.primary,
            size: 34,
          ),

          const SizedBox(height:20),

          Text(
            value,
            style: const TextStyle(
              fontSize:28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height:6),

          Text(
            title,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize:15,
            ),
          ),

        ],

      ),

    );

  }

}