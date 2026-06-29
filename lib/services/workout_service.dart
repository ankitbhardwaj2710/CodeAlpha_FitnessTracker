import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/workout_model.dart';

class WorkoutService {
Future<int> insertWorkout(WorkoutModel workout) async {
  final Database db = await DatabaseHelper.instance.database;

  return await db.insert(
    'workouts',
    workout.toMap(),
  );
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