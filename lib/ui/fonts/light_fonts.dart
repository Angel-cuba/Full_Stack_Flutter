import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle get lightSmallHeading {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
  ));
}

TextStyle get lightSubHeadingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
  ));
}

TextStyle get lightHeadingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
  ));
}
