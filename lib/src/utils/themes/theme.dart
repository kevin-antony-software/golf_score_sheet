import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TAppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline4: GoogleFonts.pinyonScript(
        color: Colors.yellow,
        //fontWeight: FontWeight.bold,
      ),
    ),
    primarySwatch: Colors.green,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline4: GoogleFonts.pinyonScript(
        color: Colors.yellow,
      ),
    ),
    primarySwatch: Colors.green,
  );
}
