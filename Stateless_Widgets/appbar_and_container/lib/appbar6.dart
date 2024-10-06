import 'package:flutter/material.dart';

class AppBar6 extends StatelessWidget {
  const AppBar6({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "AppBar and Container",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: Colors.green[200],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15,),
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.amber[900],
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue[900],
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.green[900],
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.red[800],
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.black,
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.pink,
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.indigoAccent[700],
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.purple,
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.cyan,
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 200,
                  width: 200,
                  color: Colors.brown,
                ),
                const SizedBox(height: 15,),      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
