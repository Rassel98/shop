import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/product_model.dart';

class DBHelper{
  static const String createAddMemberTable = '''CREATE TABLE $tabProducts(
      $tabMembersColId INTEGER PRIMARY KEY,
      $tabMembersColName TEXT,
      $tabMembersColCode TEXT,
      $tabMembersColShade1 TEXT,    
      $tabMembersColShade2 TEXT,    
      $tabMembersColShade3 TEXT,    
      $tabMembersColQuantity1 INTEGER,
      $tabMembersColQuantity2 INTEGER,
      $tabMembersColQuantity3 INTEGER,
      $tabMembersColMealPurches INTEGER,
      $tabMembersColRetail INTEGER, 
      $tabMembersColHole INTEGER 
      )''';

  //open database for all content

  static Future<Database> openDB() async {
      final databasesPath = await getDatabasesPath();
      final path = join(databasesPath, 'product.db');
      return openDatabase(path, version: 1, onCreate: (db, version) async {
          // When creating the db, create the table
         await db.execute(createAddMemberTable);
          //db.execute(createMemberDetailsTable);
         // db.execute(createCostDetailsTable);
      });
  }
  // base on add member model class

  static Future<int> insertData(ProductModel product) async {
      final db = await openDB();

      return db.insert(tabProducts, product.toMap());
  }

  static Future<List<ProductModel>> getAllProducts() async {
      final db = await openDB();
      final List<Map<String, dynamic>> mapList = await db.query(tabProducts);
      return List.generate(
          mapList.length, (index) => ProductModel.fromMap(mapList[index]));
  }

}