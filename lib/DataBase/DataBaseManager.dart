import 'dart:io';

import 'package:path/path.dart';
import 'package:resume_builder/UserModels/Achievements_UserModel.dart';
import 'package:resume_builder/UserModels/Skills_Languages_UserModel.dart';

import 'package:sqflite/sqflite.dart';

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

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute("CREATE TABLE ACHIEVEMENT ("
        "organization_name TEXT,"
        "qualification_name TEXT"
        ")");
    await db.execute("CREATE TABLE EDUCATION("
        "organization_name TEXT,"
        "qualification_name TEXT,"
        "year_duration TEXT"
        ")");
    await db.execute("CREATE TABLE PROFILE("
        "name TEXT,"
        "phone_no TEXT,"
        "location TEXT,"
        "mail TEXT,"
        "social_link TEXT"
        ")");
    await db.execute("CREATE TABLE SKILLS("
        "value TEXT"
        ")");
    await db.execute("CREATE TABLE WORK("
        "organization_name TEXT,"
        "qualification_name TEXT,"
        "brief TEXT,"
        "year_duration TEXT"
        ")");
  }

  // function to pass the data use the name as above scheme like for skill table use SKILL
  Future<void> insertAchievementKeys(String name, dynamic) async {
    final database = await instance.database;
    await database.insert(name, dynamic.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

// function to retrvie the list of data from the db
    Future<List<dynamic>?> queryData(String tableName,dynamic a) async {
      Database db = await instance.database;
      List<Map<String, dynamic>> maps = await db.query(tableName);
      if (maps.isNotEmpty) {
        return maps.map((map) => a.fromDbMap(map)).toList();
      }
      return null;
    }
  }

