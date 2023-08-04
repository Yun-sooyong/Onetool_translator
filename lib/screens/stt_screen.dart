import 'package:a_translator/screens/home_screen.dart';
import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/drop_down_menu.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';

class SttScreen extends StatefulWidget {
  const SttScreen({super.key});

  @override
  State<SttScreen> createState() => _SttScreenState();
}

class _SttScreenState extends State<SttScreen> {
  final SpeechToText speech = SpeechToText();
  late SpeechToTextProvider speechProvider;

  @override
  void initState() {
    super.initState();

    speechProvider = SpeechToTextProvider(speech);
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    await speechProvider.initialize();
  }

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
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 23,
                ),
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  clipBehavior: Clip.none,
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
                    ),
                    Positioned(
                      bottom: -50,
                      child: VoiceRecodingButton(themeOf: themeOf),
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

class VoiceRecodingButton extends StatefulWidget {
  const VoiceRecodingButton({
    super.key,
    required this.themeOf,
  });

  final ThemeData themeOf;

  @override
  State<VoiceRecodingButton> createState() => _VoiceRecodingButtonState();
}

class _VoiceRecodingButtonState extends State<VoiceRecodingButton> {
  bool isRecording = false;

  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {
          setState(() {
            isRecording = !isRecording;
          });
        },
        icon: Icon(
          isRecording ? BootstrapIcons.stop_fill : BootstrapIcons.mic_fill,
          size: 40,
          color: widget.themeOf.colorScheme.background,
        ),
        style: IconButton.styleFrom(
          backgroundColor: widget.themeOf.colorScheme.primary,
          fixedSize: const Size(100, 100),
        ),
      ),
    );
  }
}
