import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceriet/constants/app_constant.dart';
import 'package:groceriet/product_details_screen/product_details.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget container(Image img, String text) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.27,
      width: MediaQuery.of(context).size.width * 0.42,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Color.fromRGBO(226, 226, 226, 1))),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: img),
            SizedBox(height: 10),
            Text(text, style: AppConstant.headingTextStyle1),
            Text("7Pcs, Priceg", style: AppConstant.headingTextStyle2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 34.0, right: 20),
                  child: Text(
                    "₹60.60",
                    style: GoogleFonts.dmSans(
                        fontSize: 19, fontWeight: FontWeight.w700),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, top: 25),
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                        color: AppConstant.primaryColor),
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  int _currentIndex = 0;

  final List<String> images = [
    "assets/leaf.png",
    "assets/image 6.png",
    "assets/image 6.png",
  ];

  Widget categoryRow(String title, String subtitle, Widget content) {
    return Row(
      children: [
        Text(title, style: AppConstant.categoryTextStyle1),
        Spacer(),
        Text(subtitle, style: AppConstant.categoryTextStyle2),
      ],
    );
  }

  Widget offerBanner() {
    return Stack(children: [
      CarouselSlider(
        options: CarouselOptions(
          height: 120,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        items: images.map((image) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  height: 120,
                  width: 365,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: AssetImage("assets/image 6.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                        color: Color.fromRGBO(255, 255, 255, 0.4),
                        child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Image.asset("assets/leaf.png")),
                            Positioned(
                                left: 8,
                                child: Image.asset("assets/fruits.png")),
                            Positioned(
                                right: 0,
                                child: Image.asset(
                                    "assets/topRightVegetable.png")),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child:
                                    Image.asset("assets/bottomRightLeaf.png")),
                            Positioned(
                                top: 35,
                                right: 30,
                                child: Text("Fresh Vegetables",
                                    style: GoogleFonts.aclonica(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400))),
                            Positioned(
                                top: 57,
                                right: 60,
                                child: Text("Get Up To 40%",
                                    style: GoogleFonts.dmSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF53B175)))),
                            Positioned(
                                top: 75,
                                right: 105,
                                child: Text("OFF",
                                    style: GoogleFonts.dmSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF53B175)))),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
      Positioned(
        top: 105,
        left: 160,
        child: AnimatedSmoothIndicator(
          activeIndex: _currentIndex,
          count: images.length,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.green,
            dotColor: Colors.grey,
            dotHeight: 7,
            dotWidth: 7,
          ),
        ),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Column(
            children: [
              SizedBox(height: 35),
              Center(
                  child: SvgPicture.asset("assets/login.svg",
                      height: 30, width: 30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  Text("Pune,Maharashtra",
                      style: GoogleFonts.dmSans(
                          fontSize: 18, fontWeight: FontWeight.w700))
                ],
              ),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppConstant.searchBarColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppConstant.primaryColor),
                  ),
                  prefixIcon: Icon(Icons.search_outlined),
                  hintText: "Search Store",
                  hintStyle: GoogleFonts.dmSans(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromRGBO(124, 124, 124, 1)),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
              ),
              SizedBox(height: 20),
              offerBanner(),
              SizedBox(height: 20),
              categoryRow("Exclusive Offer", "See all", SizedBox()),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                  img: "assets/banana.png",
                                  productName: "Oraganic Bananas",
                                  weight: "1kg Price",
                                )));
                      },
                      child: container(
                          Image.asset("assets/banana.png",
                              height: 80, width: 80),
                          "Oraganic Bananas"),
                    ),
                    SizedBox(width: 18),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                  img: "assets/apple.png",
                                  productName: "Red Apple",
                                  weight: "7Pcs Price",
                                )));
                      },
                      child: container(
                          Image.asset("assets/apple.png",
                              height: 80, width: 95),
                          "Red Apple"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              categoryRow("Best Selling", "See all", SizedBox()),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                  img: "assets/mirchi.png",
                                  productName: "Bell Pepper Red",
                                  weight: "7Pcs Price",
                                )));
                      },
                      child: container(
                          Image.asset("assets/mirchi.png",
                              height: 80, width: 80),
                          "Bell Pepper Red"),
                    ),
                    SizedBox(width: 18),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                  img: "assets/ardrak.png",
                                  productName: "Ginger",
                                  weight: "7Pcs Price",
                                )));
                      },
                      child: container(
                          Image.asset("assets/ardrak.png",
                              height: 80, width: 90),
                          "Ginger"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              categoryRow("Groceries", "See all", SizedBox()),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(248, 164, 76, 0.20),
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      height: 100,
                      width: 250,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset("assets/pulses.png"),
                            SizedBox(width: 20),
                            Center(
                              child: Text("Pulses",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(62, 66, 63, 1))),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 18),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.cyan[50],
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      height: 100,
                      width: 250,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Image.asset("assets/rice.png"),
                            SizedBox(width: 20),
                            Center(
                              child: Text("Rice",
                                  style: GoogleFonts.dmSans(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromRGBO(62, 66, 63, 1))),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                  img: "assets/banana.png",
                                  productName: "Organic Bananas",
                                  weight: "7Pcs Price",
                                )));
                      },
                      child: container(
                          Image.asset("assets/banana.png",
                              height: 80, width: 80),
                          "Organic Bananas"),
                    ),
                    SizedBox(width: 18),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetailsScreen(
                                  img: "assets/chicken.png",
                                  productName: "Chicken",
                                  weight: "7Pcs Price",
                                )));
                      },
                      child: container(
                          Image.asset("assets/chicken.png",
                              height: 80, width: 90),
                          "Chicken"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
