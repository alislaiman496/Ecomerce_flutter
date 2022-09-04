import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/product_data_models.dart';
import '../models/user_product_models.dart';
import '../models/user_register_class_models.dart';
import 'MyDBManager_PinCode_services.dart';
import 'MyDBManager_services.dart';


class DBUserProduct {
  DBUserProduct._internal() {
    openDB();
  }

  Future<Database>? database;
  factory DBUserProduct() {
    return _instance;
  }
  static  final DBUserProduct _instance = DBUserProduct._internal();

  Database? _datebase;

  Future openDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'UserProductt.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    _datebase = database;
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE UserProductt ("

        "email TEXT,"
        "productId INTEGER"

        ")");
  }

  Future<int?> insertUserProduct(UserProduct userProduct) async {
    await openDB();
    return await _datebase?.insert('UserProductt', userProduct.toMap());
  }

  Future<List<UserProduct>> getUserProducts({int index=0}) async {
    await openDB();
    final List<Map<String, dynamic>>? maps = await _datebase?.query('UserProductt');

    return List.generate(maps!.length, (index) {
      return UserProduct(

        email:      maps[index]['email'],
        productId:        maps[index]['productId'],


      );
    });
  }
  Future getOneUserProduct(String email) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM UserProductt WHERE email = "$email"');
    print(res);
    print("SELECT * FROM UserProductt WHERE email = '$email'");
    if (res.length > 0) {
      print(res);
      return res.first;

      return  UserRigester.fromMap(res.first);
    }
    else {
      return null;
    }
  }
  Future<UserRigester?> getOneProductUser(int productIdd) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM UserProductt WHERE email = "$productIdd"');
    print(res);
    print("SELECT * FROM UserProductt WHERE email = '$productIdd'");
    if (res.length > 0) {
      return res;
      return  UserRigester.fromMap(res.first);
    }
    else {
      return null;
    }
  }
  Future<bool> isUserProduct(String email) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM UserProductt WHERE email = "$email"');

    print("SELECT * FROM UserProductt WHERE email = '$email'");
    return res!.isNotEmpty ? true : false;
  }


  Future<int?> updateUserProduct(UserProduct userProduct) async {
    await openDB();
    return await _datebase?.update('UserProductt', userProduct.toMap(),
        where: 'email=?', whereArgs: [userProduct.email]);
  }

  Future<void> deleteUserProduct(String email) async {
    await openDB();
    await _datebase?.delete("UserProductt", where: "email = ? ", whereArgs: [email]);
  }
}
