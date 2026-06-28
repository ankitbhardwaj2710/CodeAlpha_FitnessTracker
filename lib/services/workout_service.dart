import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/workout_model.dart';

class WorkoutService {
 Future<int> insertWorkout(WorkoutModel workout) async {
  final Database db = await DatabaseHelper.instance.database;

  final id = await db.insert(
    'workouts',
    workout.toMap(),
  );

  print("Inserted Workout ID: $id");

  final data = await db.query('workouts');

  print("Database Data: $data");

  return id;
}

  Future<List<WorkoutModel>> getWorkouts() async {
    final Database db = await DatabaseHelper.instance.database;

    final result = await db.query('workouts');

    return result.map((e) => WorkoutModel.fromMap(e)).toList();
  }

  Future<void> deleteWorkout(int id) async {
    final Database db = await DatabaseHelper.instance.database;

    await db.delete(
      'workouts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}