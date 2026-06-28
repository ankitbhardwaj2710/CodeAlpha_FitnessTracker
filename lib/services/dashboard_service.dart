import '../models/dashboard_model.dart';
import 'water_service.dart';
import 'workout_service.dart';

class DashboardService {
  final WorkoutService workoutService = WorkoutService();
  final WaterService waterService = WaterService();

  Future<DashboardStats> getStats() async {
    final workouts = await workoutService.getWorkouts();
    final water = await waterService.getTodayWater();

    int calories = 0;
    int duration = 0;

    for (final workout in workouts) {
      calories += workout.calories;
      duration += workout.duration;
    }

    return DashboardStats(
      workoutCount: workouts.length,
      totalCalories: calories,
      totalDuration: duration,
      todayWater: water,
    );
  }
}