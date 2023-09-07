import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';
import 'package:speech_to_text_macos/speech_to_text_macos.dart';
import 'package:speech_to_text/speech_recognition_result.dart';

class SttProvider {
  final SpeechToText speech = SpeechToText();
  late SpeechToTextProvider sttProvider;
  late var localName;

  initSpeechState() async {
    sttProvider = SpeechToTextProvider(speech);

    try {
      var hasSpeech = await speech.initialize();

      if (hasSpeech) {
        localName = await speech.locales();

        var systemLocal = await speech.systemLocale();
        
      }
    } catch (e) {}
  }
}
