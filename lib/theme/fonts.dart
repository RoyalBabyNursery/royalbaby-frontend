import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static double _widthFactor = 1.0;

  static void setWidthFactor(BuildContext context) {
    _widthFactor = MediaQuery
        .of(context)
        .size
        .width / 375;
  }

  static double widthFactor(double value) {
    return _widthFactor * value;
  }

  // Titles
  static TextStyle headingH4 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle caption1 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle caption2 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle body2 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle body1 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle buttonLg ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle buttonMd ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle headingH1 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle supHeading ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }
  static TextStyle supHeading3 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle body3 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle body5 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle headingH6 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 14,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle headingH5 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 16,
      fontWeight: FontWeight.w700,
      color: color,
    );
  }

  static TextStyle body4 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      color: color,
    );
  }

  static TextStyle supHeading4 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

  static TextStyle supHeading2 ({required Color color}) {
    return GoogleFonts.ibmPlexSansArabic(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: color,
    );
  }

}