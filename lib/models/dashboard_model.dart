class DashboardModel {
  final int steps;
  final int calories;
  final double water;
  final int workoutMinutes;
  final double goalPercent;

  const DashboardModel({
    required this.steps,
    required this.calories,
    required this.water,
    required this.workoutMinutes,
    required this.goalPercent,
  });
}

const DashboardModel dashboardData = DashboardModel(
  steps: 8240,
  calories: 620,
  water: 2.5,
  workoutMinutes: 55,
  goalPercent: .78,
);