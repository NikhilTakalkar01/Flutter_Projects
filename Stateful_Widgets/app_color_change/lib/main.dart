import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget{
  const MyApp({super.key});
  @override
  State createState () => _MyAppState();  
}

class _MyAppState extends State{
  bool changeColor = true;
  @override  
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("AppColor",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.amberAccent),),
          centerTitle: true,
          backgroundColor: changeColor ? Colors.red:Colors.green,
        ),
        // body: Center(
        //   child: Container(
        //     height: 100,
        //     width: 100,
        //     color: changeColor ? Colors.red:Colors.black,
        //   ),
        // ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(changeColor==true){
              changeColor = false;
            }
            else{
              changeColor = true;
            }
            setState(() {});
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.loop_outlined),
          ),
        ),
    );
  }
}

