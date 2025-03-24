import 'package:flutter/material.dart';

class SecondUI extends StatefulWidget {
  const SecondUI({super.key});

  @override
  State<SecondUI> createState() => _SecondUIState();
}

class _SecondUIState extends State<SecondUI> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
          width: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://t3.ftcdn.net/jpg/02/90/89/76/360_F_290897614_7RdAsk2GmumcGWZ2qklmV74hKlNmznSx.jpg"),
                fit: BoxFit.cover),
          ),
          child: const Text(
            "Flutter",
            style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    ));
  }
}
