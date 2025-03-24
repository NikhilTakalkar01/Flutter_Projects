import 'package:flutter/material.dart';
// import 'package:todo_list1/bottomSheet.dart';
import 'package:todo_list1/mainscreen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  // void openBottomSheet() {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return Column(
  //           children: [Text("data"),
  //           TextField(),
  //           ],
  //         );
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
       home: MyApp(),  // Scaffold(
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //   //  openBottomSheet();
      //     },
      //     child: Icon(Icons.add),
      //   ),
      // ),
    );
  }
}
