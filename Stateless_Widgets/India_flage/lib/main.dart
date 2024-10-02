import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("INDIA FLAG"),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 10,
                  height: 400,
                  color: Color.fromARGB(255, 71, 33, 20),
                ),
                Column(
                children: [
                Container(
                  height: 35,
                  width: 140,
                  color: Colors.orange,
                ),
               Container(
                height: 35,
                width: 140,
                color: Colors.white,
                child: Image.network("https://w7.pngwing.com/pngs/705/558/png-transparent-flag-of-india-ashoka-chakra-the-history-of-the-world-dharmachakra-india-thumbnail.png"),
               ),
               Container(
                height: 35,
                width: 140,
                color: Colors.green,
               ),
                ],
               ),
              ],
            ),
          ],
        ),
      ),
      ),
    );
  }
}