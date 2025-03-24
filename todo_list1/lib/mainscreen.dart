import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Color> colors = [
    const Color.fromRGBO(250, 232, 232, 1),
    const Color.fromRGBO(232, 237, 250, 1),
    const Color.fromRGBO(250, 249, 232, 1),
    const Color.fromRGBO(250, 232, 250, 1),
  ];
  List data = [
    {"text": "Lorem Ipsum is simply setting industry"},
    {
      "description":
          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"
    },
    {"date": "10 July 2023"},
  ];
  int colorIndex = 0;
  int count = 8;
  void deleteList() {
    count--;
  }

  Color getColor() {
    colorIndex = (colorIndex + 1) % colors.length;
    return colors[colorIndex];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "To-do list",
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 14, top: 3),
              child: Icon(
                Icons.search,
                color: Color.fromRGBO(255, 255, 255, 1),
                size: 27,
              ),
            )
          ],
          backgroundColor: const Color.fromRGBO(2, 167, 177, 1),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 22, left: 14, right: 14, bottom: 10),
          child: ListView.builder(
            itemCount: count,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: getColor(),
                      ),
                      width: MediaQuery.of(context).size.width * 1,
                      height: MediaQuery.of(context).size.height * 0.17,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 4, right: 4, bottom: 8),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14, top: 25),
                                  child: Container(
                                      height: 59,
                                      width: 59,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: const Color.fromRGBO(
                                            255, 255, 255, 1),
                                      ),
                                      child:
                                          Image.asset("assets/Group 42.png")),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      SizedBox(
                                        height: 29,
                                        child: Text(
                                          "Lorem Ipsum is simply setting industry.",
                                          style: GoogleFonts.quicksand(
                                            textStyle: const TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700,
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 55,
                                        child: Text(
                                          "Simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6, top: 8),
                              child: Row(
                                children: [
                                  Text(
                                    DateTime.now().toString().split(" ")[0],
                                    style: GoogleFonts.quicksand(
                                        textStyle:
                                            const TextStyle(fontSize: 13),
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.edit_outlined,
                                    color: Color.fromRGBO(0, 139, 148, 1),
                                    size: 20,
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          deleteList();
                                        });
                                      },
                                      child: const Icon(
                                        Icons.delete_outline,
                                        color: Color.fromRGBO(0, 139, 148, 1),
                                        size: 20,
                                      )),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
