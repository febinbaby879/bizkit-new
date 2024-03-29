import 'dart:developer';
import 'package:bizkit/data/sqflite/sql/oncreate_db.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

@LazySingleton()
@injectable
class LocalService {
  static const _databaseName = "bizkit.db";
  static const _databaseVersion = 1;

  static sql.Database? _database;

  Future<sql.Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<sql.Database?> _initDatabase() async {
    var databasesPath = await sql.getDatabasesPath();
    String path = join(databasesPath, _databaseName);

    return await sql.openDatabase(path,
        version: _databaseVersion,
        onCreate: (sql.Database db, int version) async =>
            await Sql.onCreate(db));
  }

  // get data from sql
  Future<List<Map<String, Object?>>> rawQuery(String query) async {
    try {
      final db = await database;
      return await db.rawQuery(query);
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // insert data
  Future insert(String table, Map<String, dynamic> map) async {
    try {
      final db = await database;
      final id = await db.insert(table, map);
      log('inserted connecton id-> $id');
    } catch (e) {
      log('insert = > ${e.toString()}');
      rethrow;
    }
  }

  // insert data
  Future rawInsert(String query, List listParams) async {
    try {
      final db = await database;
      final id = await db.rawInsert(query, listParams);
      log('inserted connecton id-> $id');
    } catch (e) {
      log('insert = > ${e.toString()}');
      rethrow;
    }
  }

  // update data
  Future update(String table, Map<String, dynamic> map, String? where,
      List<Object?>? whereArgs) async {
    try {
      final db = await database;
      return await db.update(table, map);
    } catch (e) {
      log('update = > ${e.toString()}');
      rethrow;
    }
  }

  Future rawUpdate(String query) async {
    try {
      final db = await database;
      return await db.rawUpdate(query);
    } catch (e) {
      log('update = > ${e.toString()}');
      rethrow;
    }
  }

  Future<void> rawDelete(String query, List<String> listParams) async {
    try {
      final db = await database;
      await db.rawDelete(query, listParams);
    } catch (e) {
      log('rawDelete = > ${e.toString()}');
      rethrow;
    }
  }

  // check a value is present or not in table
  Future<bool> presentOrNot(String query, List<dynamic> listParams) async {
    try {
      final db = await database;
      final count =
          sql.Sqflite.firstIntValue(await db.rawQuery(query, listParams));
      if (count != null && count > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log('presentOrNot = > ${e.toString()}');
      rethrow;
    }
  }
}
