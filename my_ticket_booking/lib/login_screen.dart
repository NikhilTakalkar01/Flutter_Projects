//import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_ticket_booking/sing_in.dart';
import './sing_up.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isError = false;

  void showError() {
    setState(() {
      isError = true;
    });
  }

  //images
  List movie = [
    "assets/bollywood.jpeg",
    "assets/Priest Movie.jpg",
    "assets/south.jpg",
  ];

  // language logic
  String text = "Language";
  void submit() {
    if (flag == true && flag2 == true) {
      text = "Language";
    } else if (flag == true) {
      text = "English";
    } else if (flag2 == true) {
      text = "Hindi";
    } else {
      text = "Language";
    }
    setState(() {});
  }

  bool flag = false;
  bool flag2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        // color: Colors.black,
        decoration: const BoxDecoration(
            image: DecorationImage(
                opacity: 0.6,
                filterQuality: FilterQuality.high,
                image: AssetImage("assets/pxfuel (3).jpg"),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 55, left: 16),
              child: Row(
                children: [
                  Row(
                    children: [
                      const Text(
                        "MB",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(241, 255, 255, 255),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "o",
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.yellow[600],
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "O",
                        style: TextStyle(
                            fontSize: 32,
                            color: Colors.yellow[600],
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "ki",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(241, 255, 255, 255),
                            fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        "ng",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(241, 255, 255, 255),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                color: Color.fromRGBO(26, 26, 26, 1),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(24),
                                    topRight: Radius.circular(24)),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 20, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Choose language",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        const Text(
                                          "Which language do you want to use?",
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  178, 255, 255, 255)),
                                        ),
                                        const SizedBox(
                                          height: 40,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            flag = !flag;
                                            setState(() {});
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "English                                                 ",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: (flag)
                                                        ? Colors.amber[600]
                                                        : Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    30,
                                                  ),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 1.6),
                                                ),
                                                child: Container(
                                                  height: 8,
                                                  width: 8,
                                                  // color: Colors.amber,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      15,
                                                    ),
                                                    color: (flag)
                                                        ? Colors.amber[600]
                                                        : const Color.fromRGBO(
                                                            26, 26, 26, 1),
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromRGBO(
                                                            26, 26, 26, 1),
                                                        width: 2.9),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        const Divider(
                                          thickness: 0.3,
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            flag2 = !flag2;
                                            setState(() {});
                                          },
                                          child: Row(
                                            children: [
                                              Text(
                                                "Hindi                                                     ",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: (flag2)
                                                        ? Colors.amber[600]
                                                        : Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    30,
                                                  ),
                                                  border: Border.all(
                                                      color: Colors.white,
                                                      width: 1.6),
                                                ),
                                                child: Container(
                                                  height: 8,
                                                  width: 8,
                                                  // color: Colors.amber,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      15,
                                                    ),
                                                    color: (flag2)
                                                        ? Colors.amber[600]
                                                        : const Color.fromRGBO(
                                                            26, 26, 26, 1),
                                                    border: Border.all(
                                                        color: const Color
                                                            .fromRGBO(
                                                            26, 26, 26, 1),
                                                        width: 2.9),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 7,
                                              )
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 100,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: StatefulBuilder(
                                                builder: (BuildContext context,
                                                    StateSetter setState) {
                                                  return (isError)
                                                      ? const Padding(
                                                          padding:
                                                              EdgeInsets.only(),
                                                          child: Text(
                                                            'An error has occurred!',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                                        )
                                                      : const Text("");
                                                },
                                              ),
                                            ),
                                            ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                    minimumSize:
                                                        const Size(150, 50),
                                                    backgroundColor:
                                                        Colors.amber[600]),
                                                onPressed: () {
                                                  if ((flag == true &&
                                                          flag2 == true) ||
                                                      (flag == false &&
                                                          flag2 == false)) {
                                                    isError = true;
                                                  } else {
                                                    isError = false;
                                                  }
                                                  setState() {}
                                                },
                                                child: const Center(
                                                  child: Text(
                                                    "Use Language",
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            26, 26, 26, 1),
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 22),
                                                  ),
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                        },
                      );
                    },
                    child: Container(
                      height: 32,
                      width: 75,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(207, 255, 255, 255),
                              width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Row(
                          children: [
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.translate_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            Text(
                              "English",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Column(
                children: [
                  SizedBox(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 180,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 80),
                          child: Row(
                            children: [
                              const Text(
                                "MB",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Color.fromARGB(241, 255, 255, 255),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "o",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.yellow[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "O",
                                style: TextStyle(
                                    fontSize: 52,
                                    color: Colors.yellow[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "ki",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Color.fromARGB(241, 255, 255, 255),
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                "ng",
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Color.fromARGB(241, 255, 255, 255),
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        // Image.asset("assets/rb.png")
                        // CarouselSlider.builder(
                        //   itemCount: movie.length,
                        //   options: CarouselOptions(
                        //     enlargeCenterPage: true,
                        //     height: MediaQuery.of(context).size.height * 0.45,
                        //     autoPlay: true,
                        //     autoPlayInterval: const Duration(seconds: 3),
                        //     reverse: false,
                        //     aspectRatio: 0.9,
                        //   ),
                        //   itemBuilder: (context, i, index) {
                        //     return GestureDetector(
                        //       child: Container(
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(15),
                        //           border: Border.all(color: Colors.white),
                        //         ),
                        //         child: ClipRRect(
                        //           borderRadius: BorderRadius.circular(15),
                        //           child: Image.asset(
                        //             movie[i],
                        //             width: 290,
                        //             fit: BoxFit.cover,
                        //           ),
                        //         ),
                        //       ),
                        //       onTap: () {},
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                      //  height: 10,
                      ),
                  const Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Enjoy your favorite movies here",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.6),
                  borderRadius: BorderRadius.circular(50)),
              child: ElevatedButton(
                onPressed: () {
                  flag3 = !flag3;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SingInScreen()),
                  );
                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 52),
                    backgroundColor: (flag3) ? Colors.amber : Colors.black),
                child: Text(
                  "Sing in",
                  style: TextStyle(
                      color: (flag3)
                          ? const Color.fromRGBO(26, 26, 26, 1)
                          : Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1.6),
                  borderRadius: BorderRadius.circular(50)),
              child: ElevatedButton(
                onPressed: () {
                  //flag4 = !flag4;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SingUpPage()),
                  );

                  setState(() {});
                },
                style: ElevatedButton.styleFrom(
                    animationDuration: const Duration(seconds: 3),
                    minimumSize: const Size(350, 52),
                    backgroundColor: (flag4) ? Colors.amber : Colors.black),
                child: Text(
                  "Sing up",
                  style: TextStyle(
                      color: (flag4) ? Colors.black : Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool flag3 = false;
  bool flag4 = false;
}
