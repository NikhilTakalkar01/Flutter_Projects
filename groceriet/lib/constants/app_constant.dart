import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppConstant {
  static Color primaryColor = const Color.fromRGBO(83, 177, 117, 1);

  static TextStyle appBarTextStyle = GoogleFonts.dmSans(
    fontSize: 20,
    color: Color.fromRGBO(24, 23, 37, 1),
    fontWeight: FontWeight.w700,
  );

  static TextStyle categoryTextStyle1 = GoogleFonts.dmSans(
    fontSize: 22,
    color: Color.fromRGBO(24, 23, 37, 1),
    fontWeight: FontWeight.w700,
  );
  static TextStyle categoryTextStyle2 = GoogleFonts.dmSans(
    fontSize: 14.5,
    color: primaryColor,
    fontWeight: FontWeight.w700,
  );
  static TextStyle headingTextStyle1 = GoogleFonts.dmSans(
    fontSize: 14.8,
    color: Color.fromRGBO(24, 23, 37, 1),
    fontWeight: FontWeight.w700,
  );
  static TextStyle headingTextStyle2 = GoogleFonts.dmSans(
    fontSize: 12,
    color: Color.fromRGBO(124, 124, 124, 1),
    fontWeight: FontWeight.w500,
  );
  static TextStyle descriptionTextStyle = GoogleFonts.dmSans(
    fontSize: 13,
    color: Color.fromRGBO(255, 255, 255, 1),
    fontWeight: FontWeight.w400,
  );

  static Color searchBarColor = Color.fromRGBO(242, 243, 242, 1);

  static Color categoryColor1 = Color.fromRGBO(83, 177, 117, 0.1);
  static Color categoryColor2 = Color.fromRGBO(248, 164, 76, 0.1);
  static Color categoryColor3 = Color.fromRGBO(247, 165, 147, 0.25);
  static Color categoryColor4 = Color.fromRGBO(211, 176, 224, 0.25);
  static Color categoryColor5 = Color.fromRGBO(253, 229, 152, 0.25);
  static Color categoryColor6 = Color.fromRGBO(183, 223, 245, 0.25);

  static Color categoryBorder1 = Color.fromRGBO(83, 177, 117, 0.7);
  static Color categoryBorder2 = Color.fromRGBO(248, 164, 76, 0.7);
  static Color categoryBorder3 = Color.fromRGBO(247, 165, 147, 1);
  static Color categoryBorder4 = Color.fromRGBO(211, 176, 224, 1);
  static Color categoryBorder5 = Color.fromRGBO(253, 229, 152, 1);
  static Color categoryBorder6 = Color.fromRGBO(183, 223, 245, 1);
}
