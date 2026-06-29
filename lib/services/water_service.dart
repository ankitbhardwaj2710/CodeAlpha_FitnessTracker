import 'package:sqflite/sqflite.dart';

import '../database/database_helper.dart';
import '../models/water_model.dart';

class WaterService {
  /// Insert Water Entry
  Future<int> insertWater(WaterModel water) async {
    final Database db = await DatabaseHelper.instance.database;

    return await db.insert(
      'water',
      water.toMap(),
    );
  }

  /// Quick Add Water (250ml, 500ml, etc.)
  Future<void> addQuickWater(int amount) async {
  await insertWater(
    WaterModel(
      amount: amount,
      dateTime: DateTime.now(),
    ),
  );
}

  /// Get All Water Entries
  Future<List<WaterModel>> getWaterEntries() async {
    final Database db = await DatabaseHelper.instance.database;

    final List<Map<String, dynamic>> maps = await db.query(
      'water',
      orderBy: 'dateTime DESC',
    );

    return List.generate(
      maps.length,
      (index) => WaterModel.fromMap(maps[index]),
    );
  }

  /// Get Today's Total Water Intake
  Future<int> getTodayWater() async {
    final Database db = await DatabaseHelper.instance.database;

    final List<Map<String, dynamic>> maps = await db.query('water');

    final now = DateTime.now();
    int total = 0;

    for (final item in maps) {
      final water = WaterModel.fromMap(item);

      if (water.dateTime.year == now.year &&
          water.dateTime.month == now.month &&
          water.dateTime.day == now.day) {
        total += water.amount;
      }
    }

    return total;
  }

  /// Delete Single Water Entry
  Future<void> deleteWater(int id) async {
    final Database db = await DatabaseHelper.instance.database;

    await db.delete(
      'water',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  /// Clear All Water Data
  Future<void> clearAllWater() async {
    final Database db = await DatabaseHelper.instance.database;

    await db.delete('water');
  }
}