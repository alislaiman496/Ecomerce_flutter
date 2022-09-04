import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/product_data_models.dart';
import '../models/user_register_class_models.dart';


class DBUserManagerProduct {
  DBUserManagerProduct._internal() {
    openDB();
  }

  Future<Database>? database;
  factory DBUserManagerProduct() {
    return _instance;
  }
  static  final DBUserManagerProduct _instance = DBUserManagerProduct._internal();

  Database? _datebase;



  Future openDB() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = join(databasesPath, 'ProductDataa.db');

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    _datebase = database;
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE ProductDataa ("
        "id INTEGER PRIMARY KEY,"
        "title TEXT,"
        "price TEXT,"
        "description TEXT,"
        "category TEXT,"
        "image TEXT"
       // "rating TEXT"
        ")");
  }

  Future<int?> insertProductData(ProductData productData) async {
    await openDB();
    return await _datebase?.insert('ProductDataa', productData.toMap());
  }

  Future<List<ProductData>> getProductData({int index=0}) async {
    await openDB();
    final List<Map<String, dynamic>>? maps = await _datebase?.query('ProductDataa');

    return List.generate(maps!.length, (index) {
      return ProductData(

        title:      maps[index]['title'],
        id:      maps[index]['id'],
        image:        maps[index]['image'],
        price:     maps[index]['price'],
       description:     maps[index]['description'],
        category:     maps[index]['category'],

      );
    });
  }
  Future<ProductData?> getOneProductData(int id) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM ProductDataa WHERE id = "$id"');
    print(res);
    print("SELECT * FROM ProductDataa WHERE id = '$id'");
    if (res.length > 0) {
      return  ProductData.fromMap(res.first);
    }
    else {
      return null;
    }
  }
  Future<bool> isProductData(int id) async {
    var dbClient = await openDB();
    var res = await dbClient.rawQuery('SELECT * FROM ProductDataa WHERE id = "$id"');

    print("SELECT * FROM ProductDataa WHERE id = '$id'");
    return res!.isNotEmpty ? true : false;
  }


  Future<int?> updateProductData(ProductData productData) async {
    await openDB();
    return await _datebase?.update('ProductDataa', productData.toMap(),
        where: 'id=?', whereArgs: [productData.id]);
  }

  Future<void> deleteProductData(int id) async {
    await openDB();
    await _datebase?.delete("ProductDataa", where: "id = ? ", whereArgs: [id]);
  }
}
