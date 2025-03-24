import 'package:flutter/material.dart';

class FirstUI extends StatefulWidget {
  const FirstUI({super.key});

  @override
  State<FirstUI> createState() => _FirstUIState();
}

class _FirstUIState extends State<FirstUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[300],
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            // alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.all(5),
              child: Image.asset(
                "assets/nature.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
