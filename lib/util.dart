import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Box Decorations
BorderRadius boxRadius = BorderRadius.circular(15);

// EdgeInsets
var titleSymeEdge = const EdgeInsets.symmetric(horizontal: 15);
var bodyEdge = const EdgeInsets.symmetric(vertical: 20, horizontal: 20);
var boxEdge = const EdgeInsets.symmetric(vertical: 8);

// Colors
/*
  Color tGreen = const Color(0xff2BAE66);
  Color tWhite = const Color(0xffFCF6F5);
  Color tRed = const Color(0xff9A161F);
  Color tPlum = const Color(0xffF4EFEA);
*/
Color backgroundColor = const Color(0xffF7F7F9);
Color primaryColor = const Color(0xffD2302C);
Color textFieldTextColor = const Color(0xff580b1c);

//

final testProvider = Provider<String>((_) => 'Hello');


