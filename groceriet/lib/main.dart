import 'package:flutter/material.dart';
import 'package:groceriet/splash_screen/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyNavigation(),
    );
  }
}

class MyNavigation extends StatefulWidget {
  const MyNavigation({super.key});

  @override
  State createState() => _MyNavigationState();
}

class _MyNavigationState extends State {
  @override
  Widget build(BuildContext constext) {
    return SplashScreen();
    // const AppNavigationScreen();
  }
}
