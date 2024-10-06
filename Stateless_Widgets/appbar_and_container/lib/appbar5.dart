import 'package:flutter/material.dart';

class AppBar5 extends StatelessWidget {
  const AppBar5({super.key});

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
          backgroundColor: Colors.red[200],
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.network("https://thumbs.dreamstime.com/b/african-angry-lion-rushe-coming-forward-generative-ai-unlock-world-limitless-creativity-our-digital-art-images-born-314767004.jpg"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.network("https://imgcdn.stablediffusionweb.com/2024/9/18/cb38f10a-22e3-46ac-bcd2-79d4b7947800.jpg"),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: SizedBox(
                height: 150,
                width: 150,
                child: Image.network("https://imgcdn.stablediffusionweb.com/2024/7/4/743bfc54-b288-4162-852e-3d472313a3d3.jpg"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
