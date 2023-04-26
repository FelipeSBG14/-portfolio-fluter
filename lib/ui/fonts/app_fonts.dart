import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/app_colors.dart';

class AppFonts {
  static titleName(size) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  static titleFunction(size) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: Colors.blue[300],
    );
  }

  static textButton(size) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w500,
    );
  }

  static resumeText(size) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: Colors.white,
    );
  }

  static buttonText(size) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryColor,
    );
  }

  static aboutText(size, color) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }
}
