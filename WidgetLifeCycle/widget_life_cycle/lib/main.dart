// import 'package:flutter/material.dart';
// import 'package:widget_life_cycle/widget_lifecycle.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WidgetLifecycle(),
//     );
//   }
// }

// import 'package:home.dart';
import 'package:flutter/material.dart';
import 'package:widget_life_cycle/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

