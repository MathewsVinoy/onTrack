import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = DataBaseHelper._internal();
  static Database? _database;
  factory DataBaseHelper() {
    return _instance;
  }
  DataBaseHelper._internal();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initdb();
    return _database;
  }

  Future<Database> initdb() async {
    final database = openDatabase(
      join(await getDatabasesPath(), 'main_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT NOT NULL, discription TEXT)',
        );
      },
      version: 1,
    );
    return database;
  }

  Future<void> insertDb(Map<String, dynamic> data) async {
    final db = await DataBaseHelper().database;
    await db?.insert('tasks', data);
  }

  Future<List<Map<String, dynamic>>> featchAllTasks() async {
    final db = await DataBaseHelper().database;
    return await db!.query('tasks');
  }

  Future<void> deleteTask(int id) async {
    final db = await DataBaseHelper().database;
    await db?.delete(
      'tasks',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
