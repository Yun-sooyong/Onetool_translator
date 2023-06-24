import 'package:a_translator/services/lang.dart';
import 'package:a_translator/services/translator_service.dart';
import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/bottom_button.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var themeOf = Theme.of(context);

    return Scaffold(
      backgroundColor: themeOf.colorScheme.background,
      extendBody: true,
      //bottomNavigationBar: const ButtonNavi(),
      appBar: AppBar(
        title: Text(
          'translator',
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
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: boxRadius,
                  color: themeOf.colorScheme.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DropdownButton(
                      items: [],
                      //controller: fstLang,
                      onChanged: (value) {},
                    ),
                    Icon(
                      BootstrapIcons.arrow_left_right,
                      color: themeOf.colorScheme.background,
                      size: 20,
                    ),
                    DropdownMenu(
                      //controller: sndLang,
                      trailingIcon: Icon(
                        BootstrapIcons.arrow_down_short,
                        color: themeOf.colorScheme.background,
                      ),
                      selectedTrailingIcon: Icon(
                        BootstrapIcons.arrow_up_short,
                        color: themeOf.colorScheme.background,
                      ),
                      dropdownMenuEntries: const [],
                      inputDecorationTheme: InputDecorationTheme(
                        border: InputBorder.none,
                        iconColor: themeOf.colorScheme.background,
                      ),
                      //initialSelection: , 기본 표기 kr
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: InputBody(themeOf: themeOf),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BottomButton(
                      icon: const Icon(BootstrapIcons.keyboard),
                      label: 'Typing',
                      onTap: () {},
                    ),
                    BottomButton(
                      icon: const Icon(BootstrapIcons.mic),
                      label: 'Voice',
                      onTap: () {},
                    ),
                    BottomButton(
                      icon: const Icon(BootstrapIcons.camera),
                      label: 'Camera',
                      onTap: () {},
                    ),
                    BottomButton(
                      icon: const Icon(BootstrapIcons.image),
                      label: 'Image',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputBody extends ConsumerWidget {
  const InputBody({
    super.key,
    required this.themeOf,
  });

  final ThemeData themeOf;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var textProvider = ref.watch(textEditProvider);
    final translator = GoogleTranslator();

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: boxEdge,
            child: Container(
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Input',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              try {
                                Clipboard.setData(
                                    ClipboardData(text: textProvider.text));
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
                            },
                            child: const Icon(
                              BootstrapIcons.clipboard,
                              size: 22,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              textProvider.clear();
                            },
                            child: const Icon(
                              BootstrapIcons.trash,
                              size: 22,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextField(
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      //controller: ref.watch(translatedText),
                      keyboardType: TextInputType.multiline,
                      readOnly: false,
                      maxLines: 10,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: boxEdge,
            child: Container(
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
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Output',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      // textfeild 위의 아이콘
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              try {
                                Clipboard.setData(
                                    ClipboardData(text: textProvider.text));
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
                            },
                            child: const Icon(
                              BootstrapIcons.clipboard,
                              size: 22,
                            ),
                          ),
                          // const SizedBox(
                          //   width: 10,
                          // ),
                          // GestureDetector(
                          //   onTap: () {
                          //     textProvider.clear();
                          //   },
                          //   child: const Icon(
                          //     BootstrapIcons.trash,
                          //     size: 22,
                          //   ),
                          // ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: ref.read(textEditProvider),
                      keyboardType: TextInputType.multiline,
                      readOnly: true,
                      maxLines: 10,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void translate() {}
}
