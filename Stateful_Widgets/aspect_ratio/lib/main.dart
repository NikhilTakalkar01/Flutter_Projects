import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Aspect Ratio",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blue[200],
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.amber,
            child: Image.network("https://img.freepik.com/premium-photo/lake-with-mountains-background-flowers-foreground_1023064-71131.jpg"),
          ),
        ),
      ),
    );
  }
}
