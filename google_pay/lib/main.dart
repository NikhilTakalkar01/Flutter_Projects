import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List buttonText = [
    {
      "name": "Scan any OR code",
      "icon": const Icon(
        Icons.qr_code_scanner,
        color: Color.fromARGB(255, 10, 29, 245),
        size: 27,
      )
    },
    {
      "name": "Pay Contacts",
      "icon": const Image(image: AssetImage("assets/phone.jpg",),fit: BoxFit.cover,height: 27,)
    },
    {"name": "Scan any OR code", "icon": Image(image: AssetImage("assets/number.jpg",),fit: BoxFit.cover,height: 27,)},
    {"name": "Scan any OR code", "icon": Icon(Icons.account_balance_outlined)},
    {"name": "Scan any OR code", "icon": Icon(Icons.add_a_photo)},
    {"name": "Scan any OR code", "icon": Icon(Icons.qr_code_scanner)},
    {"name": "Scan any OR code", "icon": Image(image: AssetImage("assets/phone.jpg",),fit: BoxFit.cover,height: 25,)},
    {
      "name": "Scan any OR code",
      "icon": Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.phone, size: 25, color: Color.fromARGB(255, 10, 29, 245)),
          Icon(Icons.phone, size: 10, color: Color.fromARGB(255, 10, 29, 245))
        ],
      )
    },
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                const SizedBox(
                  height: 60,
                  width: 330,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: SearchBar(
                      keyboardType: TextInputType.name,
                      padding: WidgetStatePropertyAll(
                        EdgeInsetsDirectional.only(
                          start: 10,
                        ),
                      ),
                      leading: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      backgroundColor: WidgetStatePropertyAll(
                          Color.fromARGB(255, 243, 246, 251)),
                    ),
                  ),
                ),
                // SizedBox(width: 20,),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 13,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(19),
                    child: Image.asset(
                      "assets/boy.jpg",
                      height: 37,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 200,
              width: 450,
              child: Image.asset("assets/page.jpg"),
            ),
            //const SizedBox(height: 10,),
            Container(
                height: 350,
                width: 350,
                //color: Colors.amber,
                child: GridView.builder(
                    //padding: EdgeInsets.all(2),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemCount: buttonText.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            buttonText[index]["icon"],
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              buttonText[index]["name"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: const Color.fromARGB(255, 5, 72, 173),
                                  fontSize: 17),
                            ),
                            SizedBox(
                              height: 7,
                            )
                          ],
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
