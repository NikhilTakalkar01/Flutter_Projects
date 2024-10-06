import 'package:flutter/material.dart';

class AppBar10 extends StatelessWidget {
  const AppBar10({super.key});

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
          backgroundColor: Colors.purple[200],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 300,
                width: 300,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 9, 40, 243),
                      width: 6,
                    ),
                    borderRadius:const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
