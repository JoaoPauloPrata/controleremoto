import 'dart:async';
import 'dart:io';
import 'package:controle/models/settings.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class DatabaseHelper {
  static Future<sql.Database> database() async {
    final dbPath = await sql.getDatabasesPath();
    return sql.openDatabase(
      path.join(dbPath + 'settings.db'),
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE settings(id TEXT PRIMARY KEY, value TEXT, key TEXT )');
      },
      version: 1,
    );
  }

  static Future<void> insert(String table, Map<String, dynamic> data) async {
    final db = await DatabaseHelper.database();
    await db.insert(
      table,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DatabaseHelper.database();
    return db.query(table);
  }
}
