// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   static Database? _database;

//   factory DatabaseHelper() {
//     return _instance;
//   }

//   DatabaseHelper._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'cart.db');
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: _onCreate,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE cart(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         productName TEXT,
//         productWeight TEXT,
//         price REAL,
//         image TEXT,
//         quantity INTEGER
//       )
//     ''');
//   }

//   Future<void> insertProduct(Map<String, dynamic> product) async {
//     final db = await database;
//     await db.insert('cart', product,
//         conflictAlgorithm: ConflictAlgorithm.replace);
//   }

//   Future<List<Map<String, dynamic>>> getProducts() async {
//     final db = await database;
//     return await db.query('cart');
//   }

//   Future<void> deleteProduct(int id) async {
//     final db = await database;
//     await db.delete('cart', where: 'id = ?', whereArgs: [id]);
//   }

//   Future<void> updateProduct(int id, int newQuantity, double newPrice) async {
//     final db = await database;
//     await db.update(
//       'cart',
//       {
//         'quantity': newQuantity,
//         'price': newPrice,
//       },
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }









// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';

// class DatabaseHelper {
//   static final DatabaseHelper _instance = DatabaseHelper._internal();
//   static Database? _database;

//   factory DatabaseHelper() {
//     return _instance;
//   }

//   DatabaseHelper._internal();

//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDatabase();
//     return _database!;
//   }

//   Future<Database> _initDatabase() async {
//     String path = join(await getDatabasesPath(), 'cart.db');

//     // Delete the existing database if it exists
//     await deleteDatabase(path);

//     return await openDatabase(
//       path,
//       version: 2, // Increment the version number
//       onCreate: _onCreate,
//       onUpgrade: _onUpgrade,
//     );
//   }

//   Future<void> _onCreate(Database db, int version) async {
//     await db.execute('''
//       CREATE TABLE cart(
//         id INTEGER PRIMARY KEY AUTOINCREMENT,
//         productName TEXT,
//         productWeight TEXT,
//         price REAL,
//         image TEXT,
//         quantity INTEGER
//       )
//     ''');
//   }

//   Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
//     if (oldVersion < 2) {
//       // Add the new column if upgrading from version 1 to 2
//       await db.execute('ALTER TABLE cart ADD COLUMN productWeight TEXT');
//     }
//   }

//   Future<void> insertProduct(Map<String, dynamic> product) async {
//     final db = await database;
//     await db.insert(
//       'cart',
//       product,
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Map<String, dynamic>>> getProducts() async {
//     final db = await database;
//     return await db.query('cart');
//   }

//   Future<void> deleteProduct(int id) async {
//     final db = await database;
//     await db.delete('cart', where: 'id = ?', whereArgs: [id]);
//   }

//   Future<void> updateProduct(int id, int newQuantity, double newPrice) async {
//     final db = await database;
//     await db.update(
//       'cart',
//       {
//         'quantity': newQuantity,
//         'price': newPrice,
//       },
//       where: 'id = ?',
//       whereArgs: [id],
//     );
//   }
// }





import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');

    return await openDatabase(
      path,
      version: 3, // Increment the version number
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    // Create cart table
    await db.execute('''
      CREATE TABLE cart(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productName TEXT,
        productWeight TEXT,
        price REAL,
        image TEXT,
        quantity INTEGER
      )
    ''');

    // Create favorites table
    await db.execute('''
      CREATE TABLE favorites(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        productName TEXT,
        productWeight TEXT,
        price REAL,
        image TEXT
      )
    ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Add the new column if upgrading from version 1 to 2
      await db.execute('ALTER TABLE cart ADD COLUMN productWeight TEXT');
    }
    if (oldVersion < 3) {
      // Create favorites table if upgrading to version 3
      await db.execute('''
        CREATE TABLE favorites(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          productName TEXT,
          productWeight TEXT,
          price REAL,
          image TEXT
        )
      ''');
    }
  }

  // Cart-related methods
  Future<void> insertProduct(Map<String, dynamic> product) async {
    final db = await database;
    await db.insert(
      'cart',
      product,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final db = await database;
    return await db.query('cart');
  }

  Future<void> deleteProduct(int id) async {
    final db = await database;
    await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> updateProduct(int id, int newQuantity, double newPrice) async {
    final db = await database;
    await db.update(
      'cart',
      {
        'quantity': newQuantity,
        'price': newPrice,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Favorite-related methods
  Future<void> addFavorite(Map<String, dynamic> favorite) async {
    final db = await database;
    await db.insert(
      'favorites',
      favorite,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await database;
    return await db.query('favorites');
  }

  Future<void> removeFavorite(String productName) async {
    final db = await database;
    await db.delete('favorites', where: 'productName = ?', whereArgs: [productName]);
  }
}