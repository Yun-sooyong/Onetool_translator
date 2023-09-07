import 'package:a_translator/provider/language_provider.dart';
import 'package:a_translator/provider/translate_provider.dart';
import 'package:a_translator/theme.dart';
import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/box_widget.dart';
import 'package:a_translator/widgets/drop_down_menu.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class VoiceScreen extends ConsumerStatefulWidget {
  const VoiceScreen({super.key});

  @override
  ConsumerState<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends ConsumerState<VoiceScreen> {
  bool isSelected = false;
  late String fromCode;
  late String toCode;
  final SpeechToText speech = SpeechToText();
  bool _hasSpeech = false;
  //List<LocaleName> _localeNames = [];
  String _currentLocaleId = '';

  @override
  void initState() {
    fromCode = 'ko';
    toCode = 'ko';
    initSpeechState();
    super.initState();
  }

  Future<void> initSpeechState() async {
    try {
      var hasSpeech = await speech.initialize();
      if (hasSpeech) {
        //_localeNames = await speech.locales();

        var systemLocale = await speech.systemLocale();
        _currentLocaleId = systemLocale?.localeId ?? '';

        // print(
        //     '${systemLocale!.name} / ${systemLocale.localeId} / $_currentLocaleId');

        // for (var element in _localeNames) {
        //   print('${element.name} / ${element.localeId}\n');
        // }
      }
      if (!mounted) return;

      setState(() {
        _hasSpeech = hasSpeech;
      });
    } catch (e) {
      print(e.toString());
      setState(() {
        _hasSpeech = false;
      });
    }
  }

  void startListening() {
    speech.listen(
      onResult: resultListener,
      localeId: _currentLocaleId,
      partialResults: true,
      cancelOnError: true,
    );
    setState(() {});
  }

  void stopListening() {
    speech.stop();
    setState(() {});
  }

  void cancelListening() {
    speech.cancel();
    setState(() {});
  }

  void resultListener(SpeechRecognitionResult result) {
    ref
        .watch(translatorProvider.notifier)
        .trans(text: result.recognizedWords, to: toCode, from: fromCode);
  }

  void statusListening() {}
  void switchLang() {}

  @override
  Widget build(BuildContext context) {
    SpeechToText speechToText = SpeechToText();
    var mSize = MediaQuery.of(context).size;
    final translation = ref.watch(translatorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      // * Floating Record Button * //
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () async {
          setState(() {
            isSelected = !isSelected;
          });
          if (isSelected) {
            startListening();
            Fluttertoast.showToast(
              msg: '녹음을 시작합니다',
              toastLength: Toast.LENGTH_SHORT,
              fontSize: 20,
            );
          } else {
            stopListening();
            Fluttertoast.showToast(
              msg: '녹음을 종료합니다',
              toastLength: Toast.LENGTH_SHORT,
              fontSize: 20,
            );
          }
        },
        child: Container(
          width: mSize.width * 0.2,
          height: mSize.height * 0.09,
          decoration: BoxDecoration(
            color:
                isSelected ? Colors.redAccent : themeData.colorScheme.primary,
            shape: BoxShape.rectangle,
            borderRadius: boxRadius,
          ),
          child: Icon(
            isSelected ? BootstrapIcons.stop : BootstrapIcons.mic,
            size: 38,
            color: themeData.colorScheme.background,
          ),
        ),
      ),
      body: Padding(
        padding: mainPadding,
        child: Column(
          children: [
            // * Dropdown //
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: themeData.colorScheme.primary,
                    width: 2,
                  ),
                  borderRadius: boxRadius,
                ),
                child: Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: DropdownMenuBar(
                        list: fromList,
                        onChanged: (value) {
                          setState(() {
                            fromCode = languageMap[value]!;
                            _currentLocaleId = languageMap[value]!;
                          });
                          print('from: $value');
                          print(fromCode);
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(BootstrapIcons.arrow_right),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: DropdownMenuBar(
                        list: toList,
                        onChanged: (value) {
                          setState(() {
                            toCode = languageMap[value]!;
                          });
                          print('to: $value');
                          print(toCode);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // * Print Trans Text //
            Expanded(
              flex: 9,
              child: TextBoxWidget(
                title: '',
                actions: const [],
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    translation,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
            // * Record Button Space //
            const Expanded(
              flex: 2,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
