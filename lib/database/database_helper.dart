import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();

    final path = join(dbPath, 'fitness_tracker.db');

    return await openDatabase(
      path,
      version: 3,
      onCreate: _createDatabase,
      onUpgrade: (db, oldVersion, newVersion) async {
        await db.execute("DROP TABLE IF EXISTS workouts");
        await db.execute("DROP TABLE IF EXISTS water");

        await _createDatabase(db, newVersion);
      },
    );
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE workouts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        category TEXT NOT NULL,
        duration INTEGER NOT NULL,
        calories INTEGER NOT NULL,
        level TEXT NOT NULL
      )
    ''');

    await db.execute('''
CREATE TABLE goals(
  id INTEGER PRIMARY KEY,
  waterGoal INTEGER,
  calorieGoal INTEGER,
  workoutGoal INTEGER
)
''');
  }
}
