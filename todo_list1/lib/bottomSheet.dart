import "package:flutter/material.dart";

void main() {
  runApp(const Bottomsheet());
}

class Bottomsheet extends StatefulWidget {
  const Bottomsheet({super.key});
  @override
  State<Bottomsheet> createState() => _Bottomsheet();
}

class _Bottomsheet extends State<Bottomsheet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       
        body: Center(
          child: Text("data"),
        ),
      ),
    );
  }
}