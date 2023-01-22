import 'package:flutter/material.dart';

const Color primaryColor = Colors.teal;
const Color secondaryColor = Color.fromARGB(255, 184, 41, 31);
const Color yellowColor = Colors.yellow;
const Color whiteColor = Colors.white;
const Color darkGrayColor = Colors.black54;
//Header color
// ignore: unnecessary_const
const lightHeader = Color.fromARGB(204, 0, 150, 110);
const darkHeader = Colors.black38;

class AppTheme {
  //
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: primaryColor,
    appBarTheme: const AppBarTheme(
      color: lightHeader,
      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.white,
      onPrimary: Colors.white,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.teal,
    ),
    iconTheme: const IconThemeData(
      color: Colors.white54,
    ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: const AppBarTheme(
      color: darkHeader,
      iconTheme: IconThemeData(
        color: Colors.yellow,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: Colors.black,
      onPrimary: Colors.black,
      secondary: Colors.red,
    ),
    cardTheme: const CardTheme(
      color: Colors.black,
    ),
    iconTheme: const IconThemeData(
      color: Colors.yellow,
    ),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
      subtitle2: TextStyle(
        color: Colors.white70,
        fontSize: 18.0,
      ),
    ),
  );
}
