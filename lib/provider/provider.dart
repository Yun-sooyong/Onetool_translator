import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final translatorLangugeSet = StateProvider((ref) => 'ko');
final translateToProvider = StateProvider((ref) => '한국어');

final textControllerStateProvider =
    StateProvider.autoDispose((ref) => TextEditingController());

final textChangeNotifierProvider = ChangeNotifierProvider.autoDispose(
    (ref) => TextNotifier(controller: ref.watch(textControllerStateProvider)));

class TextNotifier extends ChangeNotifier {
  TextEditingController controller;

  TextNotifier({
    required this.controller,
  });

  String? text = '';
  String translation = '';

  void show() {
    if (controller.text == '') {
      text = ' ';
    } else {
      text = controller.text;
    }
    notifyListeners();
  }

  void translate(var trans) {
    translation = trans;

    notifyListeners();
  }

  void clear() {
    controller.clear();
    text = '';
    translation = '';
    notifyListeners();
  }
}

///
/// *********** [USING MAP NOTIFIER PROVIDER] ***********
///
final mapProvider = ChangeNotifierProvider.autoDispose(
  (ref) => MapSearcher(),
);

class MapSearcher extends ChangeNotifier {
  String lang = '한국어';
  String code = 'ko';
  Map<String, String> langMap = {
    '한국어': 'ko',
    '일본어': 'ja',
    '영어': 'en',
    '중국어': 'zh',
    '인도네시아어': 'id',
    '이탈리아어': 'it',
    '폴란드어': 'pl',
    '러시아어': 'ru',
    '스페인어': 'es',
    '태국어': 'th',
    '베트남어': 'vi',
  };

  void searchCode(String language) {
    lang = language;
    code = langMap[language]!;

    notifyListeners();
  }
}
