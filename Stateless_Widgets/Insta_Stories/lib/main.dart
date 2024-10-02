import "package:flutter/material.dart";

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final bool buttonPress = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "insta stories",
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Instagram",
            style: TextStyle(
              color: Colors.red,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.yellow,
                      shape: BoxShape.circle,
                    ),
                    // child: Image.network(
                    //   "https://702pros.com/wp-content/uploads/2021/01/Instagram-Ring.png",
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    // child: Image.network(
                    //   "https://702pros.com/wp-content/uploads/2021/01/Instagram-Ring.png",
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                    // child: Image.network(
                    //   "https://702pros.com/wp-content/uploads/2021/01/Instagram-Ring.png",
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                      
                    ),
                    // child: Image.network(
                    //   "https://702pros.com/wp-content/uploads/2021/01/Instagram-Ring.png",
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                    // child: Image.network(
                    //   "https://702pros.com/wp-content/uploads/2021/01/Instagram-Ring.png",
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(4),
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    // child: Image.network(
                    //   "https://702pros.com/wp-content/uploads/2021/01/Instagram-Ring.png",
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
