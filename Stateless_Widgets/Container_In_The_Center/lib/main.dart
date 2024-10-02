import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("First App",),
        centerTitle: true,
        backgroundColor: Colors.blue,
        ),
        body: Center(child: Container(
          width:200,
          height:200,
          color: Colors.red,
          )
        )
      ),
    );
  }
}