import 'package:flutter/material.dart';
import 'package:travels_app/second_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {

    List<Map> details = [
      {"title1": "Best Deals", "title2": "Sorted by lower price"},
      {"title1": "Popular Destinations", "title2": "Sorted by Higher reting"},
      {"title1": "Popular Destinations", "title2": "Sorted by Higher reting"},
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        appBar: AppBar(
          title: const Text(
            "Where do you want to travel?",
            style: TextStyle(
                fontSize: 20,
                color: Color.fromRGBO(255, 255, 255, 1),
                fontWeight: FontWeight.w600),
          ),
          backgroundColor: const Color.fromRGBO(27, 48, 101, 1),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 27, top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(
                              253,
                              48,
                            ),
                            backgroundColor:
                                const Color.fromRGBO(233, 237, 248, 1)),
                        child: const Row(
                          children: [
                            Text("Select Destination"),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.keyboard_arrow_down_sharp)
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          color: const Color.fromRGBO(52, 111, 249, 1),
                        ),
                        child: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: details.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 22, bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              details[index]["title1"],
                              style:const TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w700),
                            ),
                            Row(
                              children: [
                                Text(
                                  details[index]["title2"],
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                const Icon(Icons.keyboard_arrow_down_sharp),
                              ],
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 150,
                                    width: 467,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 4,
                                        itemBuilder:
                                            (BuildContext content, int index) {
                                          return Row(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (content) {
                                                    return const SecondScreen();
                                                  }));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                    color: const Color.fromRGBO(
                                                        233, 237, 248, 1),
                                                  ),
                                                  width: 160,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 15,
                                                                    top: 10,
                                                                    right: 10),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  "El Cairo",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                ),
                                                                SizedBox(
                                                                  width: 30,
                                                                ),
                                                                Icon(
                                                                  Icons.star,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          228,
                                                                          161,
                                                                          2,
                                                                          1),
                                                                  size: 20,
                                                                ),
                                                                Text(
                                                                  " 4.5",
                                                                  style: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          228,
                                                                          161,
                                                                          2,
                                                                          1)),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15),
                                                        child: Text(
                                                          "Egypt",
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 60,
                                                                // right: 30,
                                                                top: 15,
                                                                bottom: 10),
                                                        child: Image.asset(
                                                          "assets/Vector 2534.png",
                                                          // height: 26,
                                                          // width: 50,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: Row(
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: () {},
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      minimumSize:
                                                                          const Size(
                                                                        1,
                                                                        28,
                                                                      ),
                                                                      backgroundColor: const Color
                                                                          .fromARGB(
                                                                          255,
                                                                          245,
                                                                          245,
                                                                          247)),
                                                              child: const Text(
                                                                "Move",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10),
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                              width: 3,
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: () {},
                                                              style: ElevatedButton
                                                                  .styleFrom(
                                                                      minimumSize:
                                                                          const Size(
                                                                        1,
                                                                        28,
                                                                      ),
                                                                      backgroundColor: const Color
                                                                          .fromRGBO(
                                                                          52,
                                                                          111,
                                                                          249,
                                                                          1)),
                                                              child: const Text(
                                                                "Move",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              )
                                            ],
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
