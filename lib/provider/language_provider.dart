import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageFinderProvider =
    StateProvider.autoDispose((ref) => LanguageFinder());

class LanguageFinder extends StateNotifier {
  LanguageFinder() : super('');

  String currentLang = '한국어';
  String code = 'ko';
  Map<String, String> languageMap = {
    '한국어': 'ko',
    '일본어': 'ja',
    '영어': 'en',
    '중국어(간체)': 'zh-cn',
    '중국어(번체)': 'zh-tw',
    '인도네시아어': 'id',
    '이탈리아어': 'it',
    '폴란드어': 'pl',
    '러시아어': 'ru',
    '스페인어': 'es',
    '태국어': 'th',
    '베트남어': 'vi',
  };

  void findLangCode(String? language) {
    currentLang = language!;
    code = languageMap[language]!;
  }
}

final langFinderProvider =
    StateNotifierProvider.autoDispose<LanguageState, String>(
  (ref) => LanguageState(),
);

class LanguageState extends StateNotifier<String> {
  LanguageState() : super('한국어');

  String code = 'ko';

  void setCodeState(String key) {
    state = key;
    code = languageMap[state]!;
  }
}

final Map<String, String> languageMap = {
  //'Auto': 'auto',
  '한국어': 'ko',
  '일본어': 'ja',
  '영어': 'en',
  '중국어(간체)': 'zh-cn',
  '중국어(번체)': 'zh-tw',
  '인도네시아어': 'id',
  '이탈리아어': 'it',
  '폴란드어': 'pl',
  '러시아어': 'ru',
  '스페인어': 'es',
  '태국어': 'th',
  '베트남어': 'vi',
};

final List<String> toList = [
  '한국어',
  '일본어',
  '영어',
  '중국어(간체)',
  '중국어(번체)',
  '인도네시아어',
  '이탈리아어',
  '폴란드어',
  '러시아어',
  '스페인어',
  '태국어',
  '베트남어',
];

final List<String> fromList = [
  //'Auto',
  '한국어',
  '일본어',
  '영어',
  '중국어(간체)',
  '중국어(번체)',
  '인도네시아어',
  '이탈리아어',
  '폴란드어',
  '러시아어',
  '스페인어',
  '태국어',
  '베트남어',
];
