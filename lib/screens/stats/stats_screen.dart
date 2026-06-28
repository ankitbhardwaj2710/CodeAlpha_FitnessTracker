import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../services/dashboard_service.dart';

class StatsScreen extends StatefulWidget {
  const StatsScreen({super.key});

  @override
  State<StatsScreen> createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  final DashboardService service = DashboardService();

  int workoutCount = 0;
  int calories = 0;
  int duration = 0;

  @override
  void initState() {
    super.initState();
    loadStats();
  }

  Future<void> loadStats() async {
    final stats = await service.getStats();

    setState(() {
      workoutCount = stats.workoutCount;
      calories = stats.totalCalories;
      duration = stats.totalDuration;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text("Statistics"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [

            Row(
              children: [

                Expanded(
                  child: _infoCard(
                    "Workouts",
                    workoutCount.toString(),
                    Icons.fitness_center,
                  ),
                ),

                const SizedBox(width: 15),

                Expanded(
                  child: _infoCard(
                    "Calories",
                    calories.toString(),
                    Icons.local_fire_department,
                  ),
                ),

              ],
            ),

            const SizedBox(height: 15),

            _infoCard(
              "Duration",
              "$duration min",
              Icons.timer,
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Weekly Activity",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  borderData: FlBorderData(show: false),

                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                    topTitles: const AxisTitles(),
                  ),

                  barGroups: [

                    BarChartGroupData(
                      x: 0,
                      barRods: [
                        BarChartRodData(toY: workoutCount.toDouble()),
                      ],
                    ),

                    BarChartGroupData(
                      x: 1,
                      barRods: [
                        BarChartRodData(
                          toY: (calories / 100).toDouble(),
                        ),
                      ],
                    ),

                    BarChartGroupData(
                      x: 2,
                      barRods: [
                        BarChartRodData(
                          toY: (duration / 10).toDouble(),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      color: AppColors.card,
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [

            Icon(
              icon,
              color: Colors.white,
            ),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              title,
              style: const TextStyle(
                color: Colors.white70,
              ),
            ),

          ],
        ),
      ),
    );
  }
}