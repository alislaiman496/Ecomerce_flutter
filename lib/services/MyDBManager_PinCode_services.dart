import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/user_register_class_models.dart';
import '../models/verification_code_models.dart';

class DBUserManagerPinCode {
  DBUserManagerPinCode._internal() {
    openDB();
  }

  Future<Database>? database;
  factory DBUserManagerPinCode() {
    return _instance;
  }
  static  final DBUserManagerPinCode _instance = DBUserManagerPinCode._internal();

  Database? _datebase;



  Future openDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'VerificationCodee.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    _datebase = database;
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE VerificationCodee ("
        "email TEXT PRIMARY KEY,"
        "vc_code INTEGER,"
        "gen_data TEXT,"
        "end_data TEXT,"
        "resendNumber INTEGER"
        ")");
  }

  Future<int?> insertVerificationCode(VerificationCode verificationCode) async {
    await openDB();
    return await _datebase?.insert('VerificationCodee', verificationCode.toMap());
  }

  Future<List<VerificationCode>> getVcList({int index=0}) async {
    await openDB();
    final List<Map<String, dynamic>>? maps = await _datebase?.query('VerificationCodee');

    return List.generate(maps!.length, (index) {
      return VerificationCode(

          genData:      maps[index]['gen_data'],
          endData:      maps[index]['end_data'],
          vcCode:        maps[index]['vc_code'],
          email:     maps[index]['email'],
          resendNumber:     maps[index]['resendNumber'],

         );
    });
  }
  Future<UserRigester?> getOneVerificationCode(String email) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM VerificationCodee WHERE email = "$email"');
    print(res);
    print("SELECT * FROM VerificationCodee WHERE email = '$email'");
    if (res.length > 0) {
      return  UserRigester.fromMap(res.first);
    }
    else {
      return null;
    }
  }
  Future<bool> isVerificationCode(String email) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM VerificationCodee WHERE email = "$email"');

    print("SELECT * FROM VerificationCodee WHERE email = '$email'");
    return res!.isNotEmpty ? true : false;
  }


  Future<int?> updatePinCode(VerificationCode verificationCode) async {
    await openDB();
    return await _datebase?.update('VerificationCodee', verificationCode.toMap(),
        where: 'email=?', whereArgs: [verificationCode.email]);
  }

  Future<void> deletePinCode(String email) async {
    await openDB();
    await _datebase?.delete("VerificationCodee", where: "email = ? ", whereArgs: [email]);
  }
}
