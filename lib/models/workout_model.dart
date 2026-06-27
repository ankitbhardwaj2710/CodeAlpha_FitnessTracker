class WorkoutModel {
  final String title;
  final String icon;
  final String duration;
  final int calories;
  final String level;

  const WorkoutModel({
    required this.title,
    required this.icon,
    required this.duration,
    required this.calories,
    required this.level,
  });
}

const List<WorkoutModel> workoutList = [
  WorkoutModel(
    title: "Chest Workout",
    icon: "💪",
    duration: "30 min",
    calories: 280,
    level: "Intermediate",
  ),
  WorkoutModel(
    title: "Morning Cardio",
    icon: "🏃",
    duration: "20 min",
    calories: 220,
    level: "Beginner",
  ),
  WorkoutModel(
    title: "Leg Day",
    icon: "🦵",
    duration: "40 min",
    calories: 420,
    level: "Advanced",
  ),
  WorkoutModel(
    title: "Yoga Session",
    icon: "🧘",
    duration: "25 min",
    calories: 120,
    level: "Easy",
  ),
];