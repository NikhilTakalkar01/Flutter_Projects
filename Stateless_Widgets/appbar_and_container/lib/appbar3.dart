import 'package:flutter/material.dart';

class AppBar3 extends StatelessWidget {
  const AppBar3({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hello Core2Web",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w800,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple[300], 
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 300,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
