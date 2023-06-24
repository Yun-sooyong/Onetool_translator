enum Lang {
  auto('auto', 'Auto'),
  korean('ko', '한국어'),
  japanese('jo', '일본어'),
  english('en', '영어'),
  chinese('zh', '중국어 간체'),
  arabic('ar', '아랍어'),
  hindi('hi', '힌디어'),
  hungarian('hu', '헝가리어'),
  indonesian('id', '인도네시아어'),
  italian('it', '이탈리아어'),
  lao('lo', '라오어'),
  malay('ms', '말레이어'),
  mongolian('mn', '몽골어'),
  norwegian('no', '노르웨이어'),
  polish('pl', '폴란드어'),
  portuguese('pt', '포르투갈어'),
  russian('ru', '러시아어'),
  spanish('es', '스페인어'),
  swedish('sv', '스웨덴어'),
  thai('th', '태국어'),
  vietnamese('vi', '베트남어');

  final String code;
  final String country;
  const Lang(this.code, this.country);
}
