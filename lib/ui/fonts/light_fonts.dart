import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get lightSmallHeading {
  return GoogleFonts.lato(
      textStyle: TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey[800],
  ));
}

TextStyle get lightSubHeadingStyle {
  return GoogleFonts.lato(
      textStyle: TextStyle(
          fontSize: 24, fontWeight: FontWeight.w700, color: Colors.grey[900]));
}

TextStyle get lightHeadingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  ));
}

TextStyle get lightTitleStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  ));
}
