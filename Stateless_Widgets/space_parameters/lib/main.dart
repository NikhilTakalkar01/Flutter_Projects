import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Column Demo",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color.fromARGB(214, 244, 67, 54),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            
            children: [
              Container(
                height: 150,
                width: 150,
                color: Colors.amber,
              ),
              Container(
                height: 150,
                width: 150,
                color: Colors.green,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
