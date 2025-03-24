import 'package:flutter/material.dart';
import 'package:travels_app/first_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<Icon> iconPack = [
    const Icon(Icons.airplanemode_active_sharp),
    const Icon(Icons.hotel_sharp),
    const Icon(Icons.car_crash_sharp),
    const Icon(Icons.tour),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(27, 48, 101, 1),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.favorite_sharp,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  PopupMenuButton(
                    style: const ButtonStyle(
                      iconColor: WidgetStatePropertyAll(
                        Color.fromRGBO(255, 255, 255, 1),
                      ),
                    ),
                    itemBuilder: (context) {
                      return [
                        const PopupMenuItem(
                          child: Text(
                            "First page",
                          ),
                        ),
                        const PopupMenuItem(
                          child: Text("Second page"),
                        )
                      ];
                    },
                  )
                ],
              ),
            ),
          ],
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop(
                  MaterialPageRoute(
                    builder: (context) {
                      return const FirstScreen();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.keyboard_arrow_left_sharp,
                color: Colors.white,
                size: 30,
              )),
          title: const Row(
            children: [
              Text(
                "Maharashtra",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  "  (India)",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              )
            ],
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 22,
              top: 20,
              //bottom: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Included",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
                const Text("For more details press on the icon"),
                const SizedBox(
                  height: 7,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 8,
                      ),
                      child: Row(children: [
                        Column(
                          children: [
                            Container(
                              height: 61,
                              width: 61,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(53, 109, 250, 1),
                                    width: 4),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 0,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                    color:
                                        const Color.fromRGBO(53, 109, 250, 1),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.airplanemode_active_rounded,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Flight",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 61,
                              width: 61,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(53, 109, 250, 1),
                                    width: 4),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 0,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                    color:
                                        const Color.fromRGBO(53, 109, 250, 1),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.hotel_rounded,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      size: 30,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Hotel",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 61,
                              width: 61,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(53, 109, 250, 1),
                                    width: 4),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 0,
                                        offset: Offset(0, 0),
                                      ),
                                    ],
                                    color:
                                        const Color.fromRGBO(53, 109, 250, 1),
                                  ),
                                  child: const Center(
                                    child: Icon(
                                      Icons.directions_car_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Car",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          width: 34,
                        ),
                        Column(
                          children: [
                            Container(
                              height: 61,
                              width: 61,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(53, 109, 250, 1),
                                    width: 4),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                  height: 55,
                                  width: 55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(1),
                                        spreadRadius: 2,
                                        blurRadius: 0,
                                        offset: const Offset(0, 0),
                                      ),
                                    ],
                                    color:
                                        const Color.fromRGBO(53, 109, 250, 1),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      "assets/image.png",
                                      fit: BoxFit.fill,
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Tour",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 15),
                            )
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Rating & Reviews",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.star,
                            size: 29,
                            color: Colors.amber[400],
                          ),
                          Text(
                            " 4.6",
                            style: TextStyle(
                                fontSize: 23, color: Colors.amber[700]),
                          ),
                          const SizedBox(
                            width: 18,
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            "Sorted by recent reviews ",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 26,
                          ),
                          Spacer(),
                          Text(
                            "848 Reviews",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 18,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 176, // Set a fixed height for the container
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 9),
                              child: Container(
                                height: 185,
                                width: 350,
                                margin: const EdgeInsets.only(
                                    right: 10), // Space between items
                                decoration: BoxDecoration(
                                  color: const Color.fromRGBO(230, 236, 252, 1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12, top: 8, bottom: 8),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            "India is Great",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                          Spacer(),
                                          Text("John Doe")
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[900],
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[900],
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[900],
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[900],
                                            size: 15,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.yellow[900],
                                            size: 15,
                                          ),
                                          const Spacer(),
                                          const Text(
                                            "12/10/2024",
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 17,
                                      ),
                                      const SizedBox(
                                        width: 350,
                                        height: 98,
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book",
                                          style: TextStyle(fontSize: 12.9),
                                          //maxLines: 5,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Gallery",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                    ),
                    const Row(
                      children: [
                        Text("Sorted by recent photos "),
                        Icon(Icons.keyboard_arrow_down_rounded)
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 150,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (build, context) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      right: 15,
                                    ),
                                    child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: const Color.fromRGBO(
                                              230, 236, 252, 1),
                                        ),
                                        child: Center(
                                          child: Image.asset(
                                              "assets/Vector 2534.png"),
                                        )),
                                  );
                                }),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: 5,
                  thickness: 2,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text(
                        "Expires in: 58 h 23 min",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Color.fromRGBO(52, 111, 249, 1))),
                      child: const Center(
                        child: Text(
                          "\$ 330",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
