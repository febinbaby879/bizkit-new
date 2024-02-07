import 'package:bizkit/domain/core/failure/failure.dart';
import 'package:bizkit/domain/model/user/user.dart';
import 'package:dartz/dartz.dart';
import 'package:sqflite/sqflite.dart';

abstract class UserLocalRepo {
  Future<void> onCreate(Database db, int version, String query);
  Future<Either<Failure, List<User>>> getUserData(Database db, String sql);
  Future<void> addUser(Database db, String qurey);
}
