import 'package:a_translator/util.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    background: backgroundColor,
    primary: primaryColor,
  ),
  useMaterial3: true,
  textTheme: TextTheme(
    // title medium = appbar title
    /*
      titleMedium : GoogleFonts.orbitron
      other : GoogleFonts.exo2
    */
    titleMedium: TextStyle(
      fontSize: 24,
      color: primaryColor,
      letterSpacing: 1.2,
    ),
    bodySmall: TextStyle(
      color: backgroundColor,
      fontSize: 20,
    ),
    bodyMedium: TextStyle(
      color: textFieldTextColor,
      fontSize: 20,
      fontWeight: FontWeight.w600,
    ),

    labelSmall: TextStyle(
      color: primaryColor,
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      color: primaryColor.withOpacity(0.7),
      fontSize: 22,
    ),
  ),
  iconTheme: IconThemeData(
    color: primaryColor,
    size: 32,
  ),
);
