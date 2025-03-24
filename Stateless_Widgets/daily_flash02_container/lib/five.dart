import 'package:flutter/material.dart';

class FiveUI extends StatefulWidget {
  const FiveUI({super.key});

  @override
  State<FiveUI> createState() => _FiveUIState();
}

class _FiveUIState extends State<FiveUI> {
  bool flag = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(155, 130, 161, 255),
        ),
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                flag = !flag;
              });
            },
            child: Container(
              height: 250,
              width: 250,
              alignment: Alignment.center,
              color: flag ? Colors.blue : Colors.red,
              child: Text(
                flag ? "Click Me" : "Container Tapped",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
