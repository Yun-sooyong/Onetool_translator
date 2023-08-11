import 'package:a_translator/screens/home_screen.dart';
import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/drop_down_menu.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SttScreen extends StatefulWidget {
  const SttScreen({super.key});

  @override
  State<SttScreen> createState() => _SttScreenState();
}

class _SttScreenState extends State<SttScreen> {
  SpeechToText speechToText = SpeechToText();
  var text = '아래 버튼을 눌러 녹음을 시작하세요';
  bool isListening = false;

  @override
  Widget build(BuildContext context) {
    var themeOf = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Voice',
          style: themeOf.textTheme.titleMedium,
        ),
        leading: Icon(
          BootstrapIcons.list,
          color: themeOf.iconTheme.color,
          size: 30,
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: bodyEdge,
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: DropdownLang(),
            ),
            // * Text Box //
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 23,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  clipBehavior: Clip.none,
                  fit: StackFit.expand,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: themeOf.colorScheme.primary.withOpacity(0.6),
                          width: 2,
                        ),
                        borderRadius: boxRadius,
                      ),
                      child: Text(text),
                    ),
                    // * Recording Button //
                    Positioned(
                      bottom: -50,
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 2,
                              offset: Offset(0, 3),
                              color: Colors.black45,
                            ),
                          ],
                        ),
                        child: IconButton(
                          // * 녹화 기능 파트
                          // TODOS 녹음 확인 및 번역기능 추가 필요
                          onPressed: () async {
                            if (!isListening) {
                              var aviliable = await speechToText.initialize();
                              if (aviliable) {
                                setState(() {
                                  isListening = true;
                                  speechToText.listen(
                                    onResult: (result) {
                                      setState(() {
                                        text = result.recognizedWords;
                                      });
                                    },
                                  );
                                });
                              }
                            } else {
                              setState(() {
                                isListening = false;
                              });
                              speechToText.stop();
                            }
                          },
                          icon: Icon(
                            isListening
                                ? BootstrapIcons.stop_fill
                                : BootstrapIcons.mic_fill,
                            size: 40,
                            color: themeOf.colorScheme.background,
                          ),
                          style: IconButton.styleFrom(
                            backgroundColor: themeOf.colorScheme.primary,
                            fixedSize: const Size(100, 100),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            const Expanded(
              flex: 2,
              child: Hero(
                tag: 'bottomBody',
                child: BottomBody(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
