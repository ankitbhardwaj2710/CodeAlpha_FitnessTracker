import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/goal_model.dart';

class GoalService {
  Future<void> saveGoals(GoalModel goal) async {
    final Database db = await DatabaseHelper.instance.database;

    await db.insert(
      'goals',
      goal.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<GoalModel?> getGoals() async {
    final Database db = await DatabaseHelper.instance.database;

    final data = await db.query('goals');

    if (data.isEmpty) return null;

    return GoalModel.fromMap(data.first);
  }
}