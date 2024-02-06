import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/user/user.dart';
import 'package:bizkit/domain/repository/sqflite/user_local_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart';

@LazySingleton()
@injectable
class LocalService {
  final UserLocalRepo userLocalService;

  LocalService(this.userLocalService);

  static const _databaseName = "bizkit.db";
  static const _databaseVersion = 1;
  static const _userTable = "users";

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
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(sql.Database db, int version) async {
    const queryUserTableCreation = '''
      CREATE TABLE IF NOT EXISTS $_userTable (
        ${User.colId} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${User.colName} TEXT,
        ${User.colEmail} TEXT,
        ${User.colPhone} TEXT,
        ${User.colCompanyName} TEXT,
        ${User.colAddress} TEXT,
        ${User.colIsBusiness} INTEGER DEFAULT 0
      )
    ''';
    await userLocalService.onCreate(db, version, queryUserTableCreation);
  }

  Future<Either<Failure, List<User>>> getUsers() async {
    final db = await database;
    const query = 'SELECT * FROM $_userTable';
    return await userLocalService.getUsers(db, query);
  }

  Future<void> addUser(User user) async {
    final db = await database;
    final map = user.toJson();
    // while inserting convert bool to int
    map[User.colIsBusiness] = user.isBusiness! ? 1 : 0;
    db.insert(_userTable, map);
  }
}
