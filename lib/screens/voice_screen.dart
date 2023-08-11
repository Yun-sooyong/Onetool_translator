import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/navigator.dart';
import 'package:flutter/material.dart';

class VoiceScreen extends StatefulWidget {
  const VoiceScreen({super.key});

  @override
  State<VoiceScreen> createState() => _VoiceScreenState();
}

class _VoiceScreenState extends State<VoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: mainPadding,
        child: const Column(
          children: [
            Expanded(
              flex: 11,
              child: SizedBox(),
            ),
            Expanded(
              flex: 2,
              child: Hero(
                tag: 'goNavi',
                child: GoNavigator(
                  index: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
