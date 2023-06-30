import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sourceProvider = Provider((ref) => '');

final translatorProvider = StateProvider((ref) => Translation());

class Translation {
  TextEditingController textEditController = TextEditingController();
  String source = '';
  String transText = '';
  String from = 'auto';
  String to = 'ko';

  ///
  /// FUNCTIONS
  ///
  // show translated text
  void show(var translation) {
    transText = translation;
  }

  void save(var text) {
    source = text;
  }

  void clear() {
    textEditController.clear();
    source = '';
    transText = '';
  }

  void dropdownVar(String value) {
    to = value;
  }
}
