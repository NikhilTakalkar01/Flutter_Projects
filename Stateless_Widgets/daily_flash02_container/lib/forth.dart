import 'package:flutter/material.dart';

class ForthUI extends StatefulWidget {
  const ForthUI({super.key});

  @override
  State<ForthUI> createState() => _ForthUIState();
}

class _ForthUIState extends State<ForthUI> {
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
              height: 150,
              width: 250,
              decoration: BoxDecoration(
                color: Color.fromARGB(170, 250, 97, 117),
                border: Border.all(color: Colors.green, width: 3),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Nikhil",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              )),
        ),
      ),
    );
  }
}
