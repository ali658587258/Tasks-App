import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

const Color bluishClr = Color(0xff9D3EFE);
const Color bluefaded = Color(0xff3EFEFD);
const Color pinkClr = Color(0xFFff4667);
const Color green = Color(0xff9FFE3E);
const Color white = Colors.white;
const Color primaryClr = bluishClr;
const Color KmainColor = Color(0xfffe3e3f);


class Themes {
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.grey[400] : Colors.grey,
  ));
}

TextStyle get headingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Get.isDarkMode ? Colors.white : Colors.black,
  ));
}
