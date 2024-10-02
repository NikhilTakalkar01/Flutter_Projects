import 'package:flutter/material.dart';

void main() {
  runApp(const ColorChangeApp());
}

class ColorChangeApp extends StatefulWidget {
  const ColorChangeApp({super.key});

  @override
  State<ColorChangeApp> createState() => _ColorChangeAppState();
}

bool changeColor = true;

class _ColorChangeAppState extends State<ColorChangeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: (changeColor) ? Colors.black : Colors.yellow,
        appBar: AppBar(
          title: Text(
            "Color Change App",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: (changeColor) ? Colors.black : Colors.white),
          ),
          centerTitle: true,
          backgroundColor: (changeColor) ? Colors.red : Colors.blue,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                color: (changeColor) ? Colors.amber : Colors.black,
              )
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
            backgroundColor: (changeColor) ?  Colors.yellow : Colors.black,
            child:  Text(
              "Change",
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15,color: (changeColor)? Colors.black : Colors.yellow), 
            ),
            onPressed: () {
              if (changeColor) {
                changeColor = false;
              } else {
                changeColor = true;
              }
              setState(() {});
            }),
      ),
    );
  }
}
