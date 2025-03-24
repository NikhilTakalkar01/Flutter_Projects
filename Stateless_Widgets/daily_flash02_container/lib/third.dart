import 'package:flutter/material.dart';

class ThirdUI extends StatefulWidget {
  const ThirdUI({super.key});

  @override
  State<ThirdUI> createState() => _ThirdUIState();
}

class _ThirdUIState extends State<ThirdUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber[200],
        ),
        body: Center(
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(184, 71, 248, 160),
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.only(topRight: Radius.circular(14)),
            ),
          ),
        ),
      ),
    );
  }
}
