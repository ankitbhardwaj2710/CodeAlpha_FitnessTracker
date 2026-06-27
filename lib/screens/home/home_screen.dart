import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../widgets/section_title.dart';

import 'widgets/activity_grid.dart';
import 'widgets/challenge_card.dart';
import 'widgets/goal_card.dart';
import 'widgets/greeting_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: const [

              GreetingSection(),

              SizedBox(height: 30),

              GoalCard(),

              SizedBox(height: 30),

              SectionTitle(
                title: "Today's Activity",
              ),

              SizedBox(height: 18),

              ActivityGrid(),

              SizedBox(height: 30),

              SectionTitle(
                title: "Today's Challenge",
              ),

              SizedBox(height: 15),

              ChallengeCard(),

            ],
          ),
        ),
      ),
    );
  }
}