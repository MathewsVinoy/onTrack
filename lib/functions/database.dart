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
      onCreate: (db, version) async {
        // Create tasks table
        await db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, task TEXT NOT NULL, discription TEXT)',
        );
        // Create notes table
        await db.execute(
          'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT NOT NULL, content TEXT)',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // Create notes table if upgrading from version 1
          await db.execute(
            'CREATE TABLE notes(id INTEGER PRIMARY KEY, title TEXT NOT NULL, content TEXT)',
          );
        }
      },
      version: 2, // Increment the version number
    );
    return database;
  }

  Future<void> insertDb(Map<String, dynamic> data, String table) async {
    final db = await DataBaseHelper().database;
    await db?.insert(table, data);
  }

  Future<List<Map<String, dynamic>>> fetchAllTasks() async {
    final db = await DataBaseHelper().database;
    return await db!.query('tasks');
  }

  Future<List<Map<String, dynamic>>> fetchAllNotes() async {
    final db = await DataBaseHelper().database;
    return await db!.query('notes');
  }

  Future<void> deleteTask(int id) async {
    final db = await DataBaseHelper().database;
    await db?.delete(
      'tasks',
      where: 'id=?',
      whereArgs: [id],
    );
  }

  Future<void> deleteNote(int id) async {
    final db = await DataBaseHelper().database;
    await db?.delete(
      'notes',
      where: 'id=?',
      whereArgs: [id],
    );
  }
}
