import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:groceriet/constants/app_constant.dart';

class BeveragesScreen extends StatefulWidget {
  const BeveragesScreen({super.key});

  @override
  State<BeveragesScreen> createState() => _BeveragesScreenState();
}

class _BeveragesScreenState extends State<BeveragesScreen> {
  Widget container(Image img, String text, String text2, String text3) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      width: MediaQuery.of(context).size.width * 0.43,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          border: Border.all(color: Color.fromRGBO(226, 226, 226, 1))),
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: img),
            SizedBox(height: 5),
            Text(
              text,
              style: GoogleFonts.dmSans(
                fontSize: 15,
                color: Color.fromRGBO(24, 23, 37, 1),
                fontWeight: FontWeight.w700,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
            Text(text3,
                style: GoogleFonts.dmSans(
                  fontSize: 13,
                  color: Color.fromRGBO(124, 124, 124, 1),
                  fontWeight: FontWeight.w500,
                )),
            Spacer(
              flex: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "₹$text2",
                  style: GoogleFonts.dmSans(
                      fontSize: 19, fontWeight: FontWeight.w700),
                ),
                Container(
                  height: 48,
                  width: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      color: AppConstant.primaryColor),
                  child: Icon(Icons.add, color: Colors.white, size: 30),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_left,
                        size: 35,
                      )),
                  Text(
                    "Beverages",
                    style: GoogleFonts.dmSans(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.menu_open,
                        size: 30,
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    container(Image.asset("assets/drink1.png"), "Diet Coke",
                        "90", "355ml, Price"),
                    SizedBox(
                      width: 18,
                    ),
                    container(Image.asset("assets/drink2.png"), "Sprite Can",
                        "70", "325ml Price")
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    container(Image.asset("assets/drink3.png"),
                        "Apple & Grape Juice", "300", "2L, Price"),
                    SizedBox(
                      width: 18,
                    ),
                    container(Image.asset("assets/drink4.png"), "Orange Juice",
                        "200", "2L, Price")
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    container(Image.asset("assets/drink5.png"), "Coca Cola Can",
                        "350", "325ml, Price"),
                    SizedBox(
                      width: 18,
                    ),
                    container(Image.asset("assets/drink6.png"), "Pepsi Can",
                        "300", "325ml, Price")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
