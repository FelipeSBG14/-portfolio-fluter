import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PortfolioUiConfig {
  PortfolioUiConfig._();

  static ThemeData get theme => ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryColorLight: const Color.fromARGB(255, 79, 150, 208),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 79, 150, 208),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontSize: 35,
            color: Colors.white,
            fontFamily: GoogleFonts.poppins().fontFamily,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
}
