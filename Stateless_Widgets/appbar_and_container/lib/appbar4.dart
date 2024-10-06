import 'package:flutter/material.dart';

class AppBar4 extends StatelessWidget {
  const AppBar4({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "AppBar and Container",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.blue[200],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.red[500],
              ),
            ),
            const SizedBox(height: 50,),
            Center(
              child: Container(
                height: 150,
                width: 150,
                color: Colors.blue[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
