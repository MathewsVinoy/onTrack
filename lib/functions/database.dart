import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future initdb() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'main_database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE todotb(id INTEGER PRIMARY KEY, task TEXT, discription TEXT)',
      );
    },
    version: 1,
  );
  return database;
}

Future<void> insertDb(Map<String, String> data) async {
  final db = await initdb();
  await db.insert(
    'tasks',
    data,
    ConflictAlgorithm: ConflictAlgorithm.replace,
  );
}
