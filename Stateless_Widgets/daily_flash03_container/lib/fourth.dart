import 'package:flutter/material.dart';

class FourthUI extends StatefulWidget {
  const FourthUI({super.key});

  @override
  State<FourthUI> createState() => _FourthUIState();
}

class _FourthUIState extends State<FourthUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 200,
          width: 200,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.blue,
              offset: Offset(0, 3),)
            ]
          ),
          child: const Text(
            "Flutter",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }
}
