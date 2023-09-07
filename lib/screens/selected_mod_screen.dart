import 'package:a_translator/theme.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:a_translator/widgets/bottom_button.dart';
import 'package:go_router/go_router.dart';

class SelectedModScreen extends StatelessWidget {
  const SelectedModScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size;
    var width = mediaSize.width * 0.4;
    var height = mediaSize.width * 0.35;
    return Scaffold(
      backgroundColor: themeData.primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: Icon(
        //     BootstrapIcons.gear_wide_connected,
        //     size: 25,
        //     color: themeData.colorScheme.background,
        //   ),
        // ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Text(
              // TODOS 폰트 변경 [GoogleFonts.orbitron(메인폰트), GoogleFonts.exo2(타이틀폰트)] 두개로 변경
              'Translator',
              style: themeData.textTheme.titleLarge,
            ),
            SizedBox(
              height: mediaSize.height * 0.11,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BottomButton(
                  width: width,
                  height: height,
                  isWide: true,
                  onTap: () {
                    context.go('/typing');
                  },
                  label: const Text('Typing'),
                  icon: const Icon(
                    BootstrapIcons.keyboard,
                    size: 50,
                  ),
                  color: themeData.primaryColor,
                ),
                const SizedBox(
                  width: 20,
                ),
                BottomButton(
                  width: width,
                  height: height,
                  isWide: true,
                  onTap: () {
                    context.go('/voice');
                  },
                  label: const Text('Voice'),
                  icon: const Icon(
                    BootstrapIcons.mic,
                    size: 50,
                  ),
                  color: themeData.primaryColor,
                ),
              ],
            ),
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
