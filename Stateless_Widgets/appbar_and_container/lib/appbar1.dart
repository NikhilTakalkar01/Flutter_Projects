import 'package:flutter/material.dart';


class AppBar1 extends StatelessWidget {
  const AppBar1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "AppBar and Container",
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
            ),
          ), 
          backgroundColor: Colors.blue[100],
          centerTitle: true,
          actions: const [
            Icon(Icons.search,size: 25,),
            Padding(padding: EdgeInsets.only(left: 8,right: 2,top: 5),),
            Icon(Icons.menu,size: 25,),
            Padding(padding: EdgeInsets.only(left: 10,top: 5),),
          ],
        ),
    );
  }
}
