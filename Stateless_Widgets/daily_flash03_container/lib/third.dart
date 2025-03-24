import 'package:flutter/material.dart';

class ThirdUI extends StatefulWidget {
  const ThirdUI({super.key});

  @override
  State<ThirdUI> createState() => _ThirdUIState();
}

class _ThirdUIState extends State<ThirdUI> {
  Color change = Colors.red;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            change = change == Colors.red ? Colors.green : Colors.red;
            setState(() {});
          },
          child: Container(
            alignment: Alignment.center,
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: change, width: 5),
            ),
            child: const Text(
              "Flutter",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ));
  }
}
