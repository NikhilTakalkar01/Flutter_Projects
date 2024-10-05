import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "ListView_Builder",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView.builder(itemCount: 20,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index){
          return Text(
            "index: $index",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          );
        },
        ),
      ),
    );
  }
}
