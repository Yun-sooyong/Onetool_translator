import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/box_widget.dart';
import 'package:a_translator/widgets/navigator.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TypingScreen extends StatefulWidget {
  const TypingScreen({super.key});

  @override
  State<TypingScreen> createState() => _TypingScreenState();
}

class _TypingScreenState extends State<TypingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing'),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            context.go('/');
          },
        ),
      ),
      body: Padding(
        padding: mainPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            // * TextField //
            Expanded(
              flex: 5,
              child: TextBoxWidget(
                title: 'Field',
                actions: const [
                  Icon(BootstrapIcons.clipboard),
                  SizedBox(width: 10),
                  Icon(BootstrapIcons.trash),
                ],
                child: Container(
                  color: Colors.amber,
                ),
              ),
            ),
            // * Print Translate Text //
            Expanded(
              flex: 5,
              child: TextBoxWidget(
                title: 'Text',
                actions: const [
                  Icon(BootstrapIcons.clipboard),
                  //SizedBox(width: 10),
                  //Icon(BootstrapIcons.trash),
                ],
                child: Container(),
              ),
            ),
            const Expanded(
              flex: 2,
              child: Hero(
                tag: 'goNavi',
                child: GoNavigator(
                  index: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
