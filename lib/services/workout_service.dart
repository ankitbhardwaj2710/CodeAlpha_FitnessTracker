import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';

class WorkoutService {
  Future<int> insertWorkout(Map<String, dynamic> workout) async {
    final Database db = await DatabaseHelper.instance.database;

    return await db.insert(
      'workouts',
      workout,
    );
  }

  Future<List<Map<String, dynamic>>> getWorkouts() async {
    final Database db = await DatabaseHelper.instance.database;

    return await db.query('workouts');
  }

  Future<void> deleteWorkout(int id) async {
    final Database db = await DatabaseHelper.instance.database;

    await db.delete(
      'workouts',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}