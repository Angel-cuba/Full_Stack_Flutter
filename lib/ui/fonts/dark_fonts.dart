import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get darkSmallHeading {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  ));
}

TextStyle get darkSubHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: Colors.grey.shade300,
  ));
}

TextStyle get darkHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: Colors.grey.shade300,
  ));
}
