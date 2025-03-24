// import 'package:advance_todo_app/data.dart';
// import 'package:advance_todo_app/databaseConnection.dart';
import 'package:advance_todo_app/firstscreen.dart';
// import 'package:advance_todo_app/modelclass.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  // LocalStore obj = LocalStore.getlocalStoreobj;
  // await obj.myDB();
  // List<Map<String, dynamic>> temp = await obj.getTodoData();
  // for (Map<String, dynamic> t in temp) {
  //   ModelClass mobj = ModelClass(
  //       title: t["title"], description: t["description"], date: t["date"]);
  //   TaskData.task.add(mobj);
  // }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstUI(),
    );
  }
}
