import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user_register_class_models.dart';

class DBUserManager {
  DBUserManager._internal() {
    openDB();
  }

  Future<Database>? database;
  factory DBUserManager() {
    return _instance;
  }
  static  final DBUserManager _instance = DBUserManager._internal();

  Database? _datebase;



  Future openDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'my.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    _datebase = database;
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE User ("
        "first_name TEXT,"
        "last_name TEXT,"
        "email TEXT PRIMARY KEY,"
        "mobile TEXT,"
        "password TEXT,"
        "statues INTEGER,"
        "logged_in INTEGER"
        ")");
  }

  Future<int?> insertUser(UserRigester user) async {
    await openDB();
    return await _datebase?.insert('User', user.toMap());
  }

  Future<List<UserRigester>?> getUserList() async {
    await openDB();
    final List<Map<String, dynamic>>? maps = await _datebase?.query('User');
if  (maps!.isNotEmpty) {
  return List.generate(maps.length, (index) {
      return UserRigester(

   firstName:      maps[index]['first_name'],
      lastName:      maps[index]['last_name'],
    emailAdress:        maps[index]['email'],
      mobileNumber:     maps[index]['mobile'],
       password:     maps[index]['password'],
          loggedin: maps[index]['logged_in'] ,
        statues: maps[index]['statues'] ,
         );
    });

}
else {
  return null;
}
  }
  Future<UserRigester?> getLogin(String email) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM User WHERE email = "$email"');
    if (kDebugMode) {
      print(res);
    }
    if (kDebugMode) {
      print("SELECT * FROM User WHERE email = '$email'");
    }
    if (res.length > 0) {
      return  UserRigester.fromMap(res.first);
    }
    else {
      return null;
    }
  }
  Future<bool> isLoggedIn(String email) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM User WHERE email = "$email"');

    print("SELECT * FROM User WHERE email = '$email'");
    return res!.isNotEmpty ? true : false;
  }


  Future<int?> updateUser(UserRigester user) async {
    await openDB();
    return await _datebase?.update('User', user.toMap(),
        where: 'email=?', whereArgs: [user.emailAdress]);
  }

  Future<void> deleteUser(String email) async {
    await openDB();
    await _datebase?.delete("User", where: "email = ? ", whereArgs: [email]);
  }
}
