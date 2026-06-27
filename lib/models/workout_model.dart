class WorkoutModel {
  final int? id;
  final String title;
  final String category;
  final int duration;
  final int calories;
  final String level;

  const WorkoutModel({
    this.id,
    required this.title,
    required this.category,
    required this.duration,
    required this.calories,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': title,
      'category': category,
      'duration': duration,
      'calories': calories,
      'level': level,
    };
  }

  factory WorkoutModel.fromMap(Map<String, dynamic> map) {
    return WorkoutModel(
      id: map['id'],
      title: map['name'],
      category: map['category'],
      duration: map['duration'],
      calories: map['calories'],
      level: map['level'],
    );
  }
}