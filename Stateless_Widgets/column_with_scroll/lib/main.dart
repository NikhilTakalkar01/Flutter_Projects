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
            "Column Demo",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network("https://i.pinimg.com/1200x/df/56/71/df5671b3c99eb30f15bf522756dcf6bc.jpg"),
              Container(
                height: 50,
                width: 50,  
               color: Colors.white,
              ),
              Image.network("https://totalpng.com//public/uploads/preview/car-poster-hd-editing-background-11656842388yro7nsthlm.jpg"),
              Container(
                height: 50,
                width: 50,
                color: Colors.white,
              ),
              Image.network("https://i.pinimg.com/564x/7c/ed/3d/7ced3d09d28d92c4d73a97600c154f46.jpg"),
              Container(
                height: 50,
                width: 50,
                color: Colors.white,
              ),
              Image.network("https://i.pinimg.com/736x/90/0d/fd/900dfd6a3d8e61dcb3ec57fcee93847a.jpg"),
              Container(
                height: 50,
                width: 50,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
