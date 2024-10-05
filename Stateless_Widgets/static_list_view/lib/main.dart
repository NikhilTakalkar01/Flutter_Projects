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
            "Static_List_View",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: ListView(
          children: [
            Image.network(
                "https://i.pinimg.com/736x/bd/b3/65/bdb3658903d9cedb1b1e1e370596a806.jpg"),
           const Row(
              children: [
             Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
              ],
            ),
            const Text(
              "Bhari",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Image.network("https://i.pinimg.com/736x/6f/a8/80/6fa8804eebe4bb44024f743de7378676.jpg"),
            GestureDetector(
              onTap: (){
                print("button pressed");
              },
              child: Container(
                height: 50,
                color: Colors.amber,
                child: const Text("Pressed Me"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
