import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class UserModel {
  String? email;

  UserModel({required this.email});

  Map<String, dynamic> toMap() {
    return {'email': email};
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(email: map['email']);
  }
}

class DatabaseHelper {
  static const _databaseName = 'email_check.db';
  static const _databaseVersion = 1;

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  DatabaseHelper._privateConstructor();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''
        CREATE TABLE users (
          email TEXT PRIMARY KEY
        )
      '''
    );
  }

  Future<int> insert(UserModel user) async {
    final db = await database;
    return await db.insert('users', user.toMap());
  }

  Future<List<UserModel>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return UserModel.fromMap(maps[i]);
    });
  }

  Future<bool> isDuplicateUser(String name) async {
    final users = await getUsers();
    return users.any((user) => user.email == name);
  }
}
