import 'package:a_translator/util.dart';
import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: mColor,
    background: bColor,
    primary: mColor,
  ),
  useMaterial3: true,
  // * Appbar Theme //
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: bColor,
    centerTitle: false,
    titleTextStyle: TextStyle(
      fontSize: 24,
      color: mColor,
      letterSpacing: 1.2,
      fontWeight: FontWeight.w600,
    ),
  ),
  // * Text Theme //
  textTheme: TextTheme(
    // title medium = appbar title
    /*
      titleMedium : GoogleFonts.orbitron
      other : GoogleFonts.exo2
    */
    // * title meduim = app bar title 용  
    titleMedium: TextStyle(
      fontSize: 24,
      color: mColor,
      letterSpacing: 1.2,
    ),
    // * titleLarge = mod select 화면의 메인 로고용
    titleLarge: TextStyle(
      fontSize: 56,
      color: bColor,
      letterSpacing: 3,
    ),
    bodySmall: TextStyle(
      color: backgroundColor,
      fontSize: 20,
    ),
    // * bodyMedium == default text theme 
    bodyMedium: TextStyle(
      color: mColor,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    ),

    labelSmall: TextStyle(
      color: mColor,
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      color: mColor.withOpacity(0.7),
      fontSize: 22,
    ),
  ),
  // * Icon Theme //
  iconTheme: IconThemeData(
    color: mColor,
    size: 32,
  ),
);
