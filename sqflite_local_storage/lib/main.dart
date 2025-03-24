import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import "college_model.dart";

dynamic database;

//insert database
void insertData(College cObj) async {
  Database localDB = await database;
  int id = await localDB.insert(
    "College",
    cObj.collegeMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  print(id);
}

//update database
updateData(College cObj) async {
  Database localDB = await database;
  await localDB.update(
    "College",
    cObj.collegeMap(),
    where: "rollNo=?",
    whereArgs: [cObj.rollNo],
  );
}

//remove database
removeData(int rollNo) async {
  Database localDB = await database;
  await localDB.delete("College", where: "rollNo = ?", whereArgs: [rollNo]);
}

//get data
Future<List<Map<String, dynamic>>> getCollegeData() async {
  Database localDB = await database;
  List<Map<String, dynamic>> collegeData = await localDB.query("College");
  return collegeData;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  database = openDatabase(
    join(await getDatabasesPath(), "CollegeDB.db"),
    version: 1,
    onCreate: (db, version) async {
      await db.execute('''CREATE TABLE College(
          studentName TEXT,
          rollNo INT PRIMARY KEY,
          marks INT
          )''');
    },
  );

  College obj1 = College(studentName: "Vipul", rollNo: 12, marks: 78);
  College obj2 = College(studentName: "Mayur", rollNo: 10, marks: 75);
  College obj3 = College(studentName: "Pratik", rollNo: 18, marks: 70);

  insertData(obj1);
  insertData(obj2);
  insertData(obj3);

  print(await getCollegeData());

  obj3 = College(studentName: "Pratik", rollNo: 18, marks: 73);
  updateData(obj3);
  print(await getCollegeData());

  removeData(obj3.rollNo);

  print(await getCollegeData());
}
