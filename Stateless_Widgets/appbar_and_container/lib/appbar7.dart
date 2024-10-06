import 'package:flutter/material.dart';

class AppBar7 extends StatelessWidget {
  const AppBar7({super.key});

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
          backgroundColor: Colors.pink[200],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15,),
                Container(
                  height: 300,
                  width: 300,
                  child: Image.network("https://m.media-amazon.com/images/I/61jDgzwXUxL._AC_UF1000,1000_QL80_.jpg"),
                ),
                const SizedBox(width: 10,),      
                Container(
                  height: 300,
                  width: 300,
                  child: Image.network("https://i.pinimg.com/736x/67/7d/06/677d06ac6d56cfd30a53ff3a5e2ce02b.jpg"),
                ),
                const SizedBox(width: 10,),      
                Container(
                  height: 300,
                  width: 300,
                  child: Image.network("https://t3.ftcdn.net/jpg/07/82/04/28/360_F_782042893_gsP4S93xGRJyg2mH13jkAzLYhsg1E5xU.jpg"),
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 300,
                  width: 300,
                  child: Image.network("https://imgcdn.stablediffusionweb.com/2024/3/10/a937ee4d-c373-4615-a183-fa353d456017.jpg"),
                ),
                const SizedBox(height: 15,),      
                Container(
                  height: 300,
                  width: 300,
                  child: Image.network("https://ghantee.com/wp-content/uploads/2024/06/mesmerizing-lord-shiva-8k-image.jpg"),
                ),      
              ],
            ),
          ),
        ),
      ),
    );
  }
}
