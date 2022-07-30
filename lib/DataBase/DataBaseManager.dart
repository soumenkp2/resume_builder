import 'dart:io';

import 'package:path/path.dart';
import 'package:resume_builder/UserModels/Achievements_UserModel.dart';
import 'package:resume_builder/UserModels/Skills_Languages_UserModel.dart';

import 'package:sqflite/sqflite.dart';

import '../UserModels/Education_UserModel.dart';
import '../UserModels/Profile_UserModel.dart';
import '../UserModels/Work_Projects_UserModel.dart';
import 'TableName.dart';

class DataBaseManager {
  // name for the data base
  static final _dbName = 'Resume.Db';

  // private constructor
  DataBaseManager._privateConstructor();

  // Instance of DataBaseManager
  static final DataBaseManager instance = DataBaseManager._privateConstructor();

  // object of database
  static Database? _database;

  // Singleton declaration  of database
  // await can only be called under the async
  // async runs in background and await is used to notify the work
  Future<Database> get database async {
    if (_database != null)
      return _database!;
    else {
      _database = await _initDatabase();
      return _database!;
    }
  }

  // initialise the database
  /* path is required to make the database and retrieve it for the use

   */
  _initDatabase() async {
    final path2 = await getDatabasesPath();
    String path = join(path2, _dbName);
    print(path);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute("CREATE TABLE ACHIEVEMENT ("
         "id TEXT UNIQUE,"
        "tableName TEXT ,"
        "organization_name TEXT ,"
        "qualification_name TEXT "
        ")");
    await db.execute("CREATE TABLE EDUCATION("
        "id TEXT UNIQUE,"
        "tableName TEXT,"
        "organization_name TEXT ,"
        "qualification_name TEXT ,"
        "year_duration TEXT "
        ")");
    await db.execute("CREATE TABLE PROFILE("
        "id TEXT UNIQUE,"
        "tableName TEXT ,"
        "name TEXT ,"
        "phone_no TEXT ,"
        "location TEXT ,"
        "mail TEXT ,"
        "social_link TEXT "
        ")");
    await db.execute("CREATE TABLE SKILLS("
        "id TEXT UNIQUE,"
        "tableName TEXT ,"
        "value TEXT "
        ")");
    await db.execute("CREATE TABLE WORK("
        "id TEXT UNIQUE,"
        "tableName TEXT ,"
        "organization_name TEXT ,"
        "qualification_name TEXT ,"
        "brief TEXT,"
        "year_duration TEXT "
        ")");
    await db.execute("CREATE TABLE PROJECT("
        "id TEXT UNIQUE,"
        "tableName TEXT ,"
        "organization_name TEXT ,"
        "qualification_name TEXT ,"
        "brief TEXT ,"
        "year_duration TEXT "
        ")");

    await db.execute("CREATE TABLE TABLENAME("
        "id TEXT UNIQUE,"
        "tableName TEXT UNIQUE"
        ")");
    await db.execute("CREATE TABLE LANGUAGE("
        "id TEXT UNIQUE,"
        "tableName TEXT,"
        "value TEXT "
        ")");
  }

  // function to pass the data use the name as above scheme like for skill table use SKILL
  Future<void> insertKeys(String name, dynamic) async {
    final database = await instance.database;
    await database.insert(name, dynamic.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

// function to retrieve the list of data from the db
  Future<List<Skills_Languages_UserModel>?> querySkillsData(
      String tableName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query("SKILLS",where: "tableName= ?",whereArgs: [tableName]);
    if (maps.isNotEmpty) {
      return maps
          .map((map) => Skills_Languages_UserModel.fromDbMap(map))
          .toList();
    }
    return null;
  }

  Future<List<Education_UserModel>?> queryEduData(String tableName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query("EDUCATION",where: "tableName= ?",whereArgs: [tableName]);
    if (maps.isNotEmpty) {
      return maps.map((map) => Education_UserModel.fromDbMap(map)).toList();
    }
    return null;
  }

  Future<List<Achievements_UserModel>?> queryAchievementData(
      String tableName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query(" ACHIEVEMENT",where: "tableName= ?",whereArgs: [tableName]);
    if (maps.isNotEmpty) {
      return maps.map((map) => Achievements_UserModel.fromDbMap(map)).toList();
    }
    return null;
  }

  Future<List<Profile_UserModel>?> queryProfileData(String tableName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query("PROFILE",where: "tableName= ?",whereArgs: [tableName]);
    if (maps.isNotEmpty) {
      return maps.map((map) => Profile_UserModel.fromDbMap(map)).toList();
    }
    return null;
  }

  Future<List<Work_Projects_UserModel>?> queryWorkData(String tableName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query("WORK",where: "tableName= ?",whereArgs: [tableName]);
    if (maps.isNotEmpty) {
      return maps.map((map) => Work_Projects_UserModel.fromDbMap(map)).toList();
    }
    return null;
  }

  Future<List<TableName>?> queryTableData() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query("TABLENAME");

      return maps.map((map) => TableName.fromDB(map)).toList();

  }

  Future<List<Skills_Languages_UserModel>?> queryLanguageData(
      String tableName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query("LANGUAGE",where: "tableName= ?",whereArgs: [tableName]);
    if (maps.isNotEmpty) {
      return maps
          .map((map) => Skills_Languages_UserModel.fromDbMap(map))
          .toList();
    }
    return null;
  }

  Future<List<Work_Projects_UserModel>?> queryProjectData(
      String tableName) async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query("PROJECT",where: "tableName= ?",whereArgs: [tableName]);
    if (maps.isNotEmpty) {
      return maps.map((map) => Work_Projects_UserModel.fromDbMap(map)).toList();
    }
    return null;
  }
  Future  delete(String tableName) async {
    Database db = await instance.database;
    await db.delete("PROJECT", where: 'tableName= ?', whereArgs: [tableName]);
    await db.delete("LANGUAGE", where: 'tableName= ?', whereArgs: [tableName]);
    await db.delete("TABLENAME", where: 'tableName= ?', whereArgs: [tableName]);
    await db.delete("WORK", where: 'tableName= ?', whereArgs: [tableName]);
    await db.delete("PROFILE", where: 'tableName= ?', whereArgs: [tableName]);
    await db.delete("ACHIEVEMENT", where: 'tableName= ?', whereArgs: [tableName]);
    await db.delete("EDUCATION", where: 'tableName= ?', whereArgs: [tableName]);
    await db.delete("SKILLS", where: 'tableName= ?', whereArgs: [tableName]);
  }

}
