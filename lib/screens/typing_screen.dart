import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';

import 'package:a_translator/provider/language_provider.dart';
import 'package:a_translator/provider/translate_provider.dart';
import 'package:a_translator/widgets/box_widget.dart';
import 'package:a_translator/widgets/drop_down_menu.dart';
import 'package:a_translator/util.dart';

class TypingScreen extends ConsumerStatefulWidget {
  const TypingScreen({super.key});

  @override
  ConsumerState<TypingScreen> createState() => _TypingScreenState();
}

class _TypingScreenState extends ConsumerState<TypingScreen> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(textEditProvider);
    final translation = ref.watch(translatorProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Typing'),
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
              child: LanguageDropdown(),
            ),
            // * TextField //
            Expanded(
              flex: 5,
              child: TextBoxWidget(
                title: 'Auto',
                actions: [
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      controller.text = '';
                      ref.watch(translatorProvider.notifier).clear();
                    },
                    child: const Icon(BootstrapIcons.trash),
                  ),
                ],
                child: SizedBox.expand(
                  child: TextField(
                    controller: controller,
                    keyboardType: TextInputType.text,
                    maxLines: null,
                    decoration: const InputDecoration(
                      hintText: '내용을 입력해 주세요',
                      border: InputBorder.none,
                    ),
                    onSubmitted: (value) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    onChanged: (value) {
                      try {
                        ref.watch(translatorProvider.notifier).trans(
                              text:value,
                              to:ref.watch(langFinderProvider.notifier).code,
                              
                            );
                      } catch (e) {
                        Fluttertoast.showToast(
                            msg: e.toString(), toastLength: Toast.LENGTH_SHORT);
                      }
                    },
                  ),
                ),
              ),
            ),
            // * Print Translated Text //
            Expanded(
              flex: 5,
              child: TextBoxWidget(
                title: ref.watch(langFinderProvider),
                //languageMap[ref.watch(langFinderProvider)]!,
                actions: [
                  //Icon(BootstrapIcons.volume_up),
                  //SizedBox(width: 10),
                  GestureDetector(
                    child: const Icon(
                      BootstrapIcons.clipboard,
                    ),
                    onTap: () {
                      copyClipboard(translation);
                    },
                  ),
                ],
                // * Printing Text * //
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(translation),
                ),
              ),
            ),
            // const Expanded(
            //   flex: 2,
            //   child: Hero(
            //     tag: 'goNavi',
            //     child: GoNavigator(
            //       index: 0,
            //     ),
            //   ),
            // ),
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  void copyClipboard(String text) {
    try {
      Clipboard.setData(
        ClipboardData(
          text: text,
        ),
      );
      Fluttertoast.showToast(
        msg: '클립보드에 복사되었습니다.',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    } catch (e) {
      Fluttertoast.showToast(
        msg: '복사에 실패했습니다.\nError:$e',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
