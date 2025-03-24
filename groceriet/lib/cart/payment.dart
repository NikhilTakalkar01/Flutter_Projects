import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceriet/home_screen/home_screen.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/mainPage.jpg",
              ),
              Image.asset(
                "assets/mainPage.jpg",
              ),
              Image.asset(
                "assets/mainPage.jpg",
              ),
              Image.asset(
                "assets/mainPage.jpg",
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: BackdropFilter(
            filter: ImageFilter.blur(
                sigmaX: 20.0, sigmaY: 20.0, tileMode: TileMode.clamp),
            child: Container(
                color: Color.fromRGBO(
                    254, 254, 254, 0.265) // Transparent container to apply blur
                ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.transparent,
                Color.fromARGB(200, 255, 255, 255),
                Color.fromARGB(200, 255, 255, 255),

                Colors.transparent,
                // Color.fromARGB(188, 255, 255, 255),
                // Colors.transparent,
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0.5, end: 1),
                      duration: Duration(seconds: 3),
                      builder: (context, double size, child) {
                        return Image.asset("assets/payment.png");
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Your Order has been Accepted",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Your items has been placcd and is on it’s way to being processed",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.dmSans(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: 800,
            left: 180,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              },
              child: Text(
                "Home",
                style: GoogleFonts.dmSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ))
      ]),
    );
  }
}


      // Blur effect covering the entire screen
   
      // Positioned(
      //   top: 300,
      //   left: 50,
      //   right: 60,
      //   child: Image.asset("assets/payment.png"),
      // )