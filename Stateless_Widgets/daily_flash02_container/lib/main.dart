import 'package:flutter/material.dart';
//import './first.dart';
//import './second.dart';
//import "./third.dart";
//import 'forth.dart';
import './five.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FiveUI(),
    );
  }
}
