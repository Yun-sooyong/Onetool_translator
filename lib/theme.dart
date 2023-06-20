import 'package:a_translator/util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var themeData = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    background: backgroundColor,
    primary: primaryColor,
  ),
  useMaterial3: true,
  textTheme: TextTheme(
    // title medium = appbar title
    titleMedium: GoogleFonts.orbitron(
      fontSize: 24,
      color: primaryColor,
      letterSpacing: 1.2,
    ),
    bodyMedium: TextStyle(
      color: backgroundColor,
    ),
    labelMedium: GoogleFonts.exo2(
      color: primaryColor,
      fontSize: 14,
    ),
  ),
  iconTheme: IconThemeData(
    color: primaryColor,
  ),
);
