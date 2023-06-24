import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final textEditProvider = Provider((ref) {
  TextEditingController controller = TextEditingController();
  return controller;
});

