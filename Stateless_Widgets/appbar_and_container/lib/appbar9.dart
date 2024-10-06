import 'package:flutter/material.dart';

class AppBar9 extends StatelessWidget {
  const AppBar9({super.key});

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
          backgroundColor: Colors.amber[200],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(border: Border.all(color: Colors.red,width: 6,),borderRadius: BorderRadius.circular(20)),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
