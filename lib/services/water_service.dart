import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/water_model.dart';

class WaterService {
  Future<int> insertWater(WaterModel water) async {
    final Database db = await DatabaseHelper.instance.database;

    return db.insert(
      'water',
      water.toMap(),
    );
  }

  Future<List<WaterModel>> getWaterHistory() async {
    final Database db = await DatabaseHelper.instance.database;

    final result = await db.query(
      'water',
      orderBy: 'id DESC',
    );

    return result.map((e) => WaterModel.fromMap(e)).toList();
  }

  Future<void> deleteAllWater() async {
    final Database db = await DatabaseHelper.instance.database;

    await db.delete('water');
  }

  Future<int> getTodayTotal() async {
    final Database db = await DatabaseHelper.instance.database;

    final result = await db.rawQuery(
      'SELECT SUM(amount) as total FROM water',
    );

    if (result.first["total"] == null) {
      return 0;
    }

    return result.first["total"] as int;
  }
}