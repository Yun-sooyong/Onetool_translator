import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

// * Provider * //
// * TextField Controller Provider
final textEditProvider =
    StateNotifierProvider<TextControllerNotifier, TextEditingController>(
        (ref) => TextControllerNotifier());

class TextControllerNotifier extends StateNotifier<TextEditingController> {
  TextControllerNotifier() : super(TextEditingController());
}

// * Translator

final translatorProvider =
    StateNotifierProvider.autoDispose<TranslatorNotifier, String>(
        (ref) => TranslatorNotifier());

class TranslatorNotifier extends StateNotifier<String> {
  TranslatorNotifier() : super('');

  // * 번역기능
  void trans({required String text, required String to, String from = 'auto'}) {
    if (text.isNotEmpty) {
      GoogleTranslator()
          .translate(text, to: to, from: from)
          .then((value) => state = value.text);
    } else {
      state = '';
    }
  }

  // * 삭제
  void clear() {
    state = '';
  }
}

// TODOS 언어변경 설정을 위한 Provider 만들기