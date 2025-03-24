import "package:path/path.dart";
import "package:sqflite/sqflite.dart";

// class LocalStore {
//   dynamic database;
//   static LocalStore _lObj = LocalStore();

//   //intialize database

//   static LocalStore get getlocalStoreobj => _lObj;
//   Future<Database> myDB() async {
//     database = openDatabase(
//       join(await getDatabasesPath(), "TodoDB.db"),
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
// CREATE TABLE TODO(
// title TEXT PRIMARY KEY,
// description TEXT,
// date TEXT
// )
// ''');
//       },
//     );
//     return database;
//   }

// //insert data

//   void insertData() async {
//     Database localDB = await database;
//     await localDB.insert(
//       "Todo",
//       {"title": "java", "description": "skjfjdj", "date": "12/12/2024"},
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }

//   Future<List<Map<String, dynamic>>> getTodoData() async {
//     Database localDB = await database;
//     List<Map<String, dynamic>> data = await localDB.query("Todo");
//     return data;
//   }
// }

Future<Database> initializeDB() async {
  String path = join(await getDatabasesPath(), 'todo.db');
  return openDatabase(
    path,
    onCreate: (database, version) async {
      await database.execute(
        'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT NOT NULL)',
      );
    },
    version: 1,
  );
}

Future<void> insertTodo(String title, String description, String date) async {
  Database db = await initializeDB();
  await db.insert(
    'todo',
    {'title': title, 'description': description, 'date': date},
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Map<String, dynamic>>> getTodo() async {
  Database db = await initializeDB();
  return db.query('todo');
}
