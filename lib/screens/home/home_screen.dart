import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/dashboard_model.dart';
import '../../services/dashboard_service.dart';
import '../../widgets/section_title.dart';

import 'widgets/activity_grid.dart';
import 'widgets/challenge_card.dart';
import 'widgets/goal_card.dart';
import 'widgets/greeting_section.dart';
import 'widgets/water_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DashboardService _dashboardService = DashboardService();

  DashboardStats? stats;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    final result = await _dashboardService.getStats();

    if (!mounted) return;

    setState(() {
      stats = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: loadDashboard,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const GreetingSection(),

                      const SizedBox(height: 30),

                      GoalCard(
                        totalCalories: stats!.totalCalories,
                        totalDuration: stats!.totalDuration,
                        workoutCount: stats!.workoutCount,
                      ),

                      const SizedBox(height: 30),

                      const SectionTitle(
                        title: "Today's Activity",
                      ),

                      const SizedBox(height: 18),

                      ActivityGrid(
                        workoutCount: stats!.workoutCount,
                        calories: stats!.totalCalories,
                        duration: stats!.totalDuration,
                      ),

                      const SizedBox(height: 30),

                      const SectionTitle(
                        title: "Today's Water",
                      ),

                      const SizedBox(height: 15),

                      const WaterCard(),

                      const SizedBox(height: 30),

                      const SectionTitle(
                        title: "Today's Challenge",
                      ),

                      const SizedBox(height: 15),

                      const ChallengeCard(),

                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}