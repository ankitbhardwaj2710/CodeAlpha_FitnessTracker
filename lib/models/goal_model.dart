class GoalModel {
  final int waterGoal;
  final int calorieGoal;
  final int workoutGoal;

  GoalModel({
    required this.waterGoal,
    required this.calorieGoal,
    required this.workoutGoal,
  });

  Map<String, dynamic> toMap() {
    return {
      'waterGoal': waterGoal,
      'calorieGoal': calorieGoal,
      'workoutGoal': workoutGoal,
    };
  }

  factory GoalModel.fromMap(Map<String, dynamic> map) {
    return GoalModel(
      waterGoal: map['waterGoal'],
      calorieGoal: map['calorieGoal'],
      workoutGoal: map['workoutGoal'],
    );
  }
}