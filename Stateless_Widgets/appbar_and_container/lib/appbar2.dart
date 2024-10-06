import 'package:flutter/material.dart';

class AppBar2 extends StatelessWidget {
  const AppBar2({super.key});

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
        // centerTitle: true,
          actions: const [
            Icon(Icons.menu,size: 25,),
            Padding(padding: EdgeInsets.only(left: 13), )
          ],
        ),
      ),
    );
  }
}
