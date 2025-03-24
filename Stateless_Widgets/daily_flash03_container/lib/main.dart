//import 'package:daily_flash03_container/first.dart';
import 'package:daily_flash03_container/fourth.dart';
import 'package:daily_flash03_container/second.dart';
import 'package:daily_flash03_container/third.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: FourthUI());
  }
}
