import '../models/dashboard_stats.dart';
import 'workout_service.dart';

class DashboardService {
  final WorkoutService _service = WorkoutService();

  Future<DashboardStats> getStats() async {
  final workouts = await _service.getWorkouts();

  print("Dashboard Workouts Count: ${workouts.length}");

  int calories = 0;
  int duration = 0;

  for (final workout in workouts) {
    print(workout.toMap());

    calories += workout.calories;
    duration += workout.duration;
  }

  return DashboardStats(
    workoutCount: workouts.length,
    totalCalories: calories,
    totalDuration: duration,
  );
}
}