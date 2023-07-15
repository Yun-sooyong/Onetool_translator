import 'package:a_translator/provider/provider.dart';
import 'package:a_translator/util.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:translator/translator.dart';

class TextBox extends ConsumerStatefulWidget {
  final bool isTextField;

  const TextBox({
    super.key,
    this.isTextField = false,
  });

  @override
  TextBoxState createState() => TextBoxState();
}

class TextBoxState extends ConsumerState<TextBox> {
  @override
  Widget build(BuildContext context) {
    final themeOf = Theme.of(context);
    var mProvider = ref.watch(mapProvider);
    var textProvider = ref.watch(textChangeNotifierProvider);
    final controller = ref.watch(textControllerStateProvider);

    String code = mProvider.code;
    String lang = mProvider.lang;

    return Padding(
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
                  widget.isTextField ? 'Auto' : lang,
                  style: themeOf.textTheme.labelLarge,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        try {
                          Clipboard.setData(
                            ClipboardData(
                                text: widget.isTextField
                                    ? textProvider.text!
                                    : textProvider.translation),
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
                      },
                      child: const Icon(
                        BootstrapIcons.clipboard,
                        size: 22,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    widget.isTextField
                        ? GestureDetector(
                            onTap: () {
                              textProvider.clear();
                            },
                            child: const Icon(
                              BootstrapIcons.trash,
                              size: 22,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  if (widget.isTextField) {
                    return TextField(
                      textInputAction: TextInputAction.go,
                      // 엔터, 확인 버튼을 누르면 키보드를 내리게 함
                      onSubmitted: (value) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onChanged: (source) async {
                        try {
                          textProvider.show();
                          if (source.isNotEmpty) {
                            await GoogleTranslator()
                                .translate(
                                  textProvider.text!,
                                  to: code,
                                )
                                .then(
                                  (value) => textProvider.translate(value.text),
                                );
                          } else {
                            textProvider.translate('');
                          }
                        } catch (e) {
                          Fluttertoast.showToast(
                            msg: '에러가 발생했습니다. 다시 시도해 주세요.\n${e.toString()}',
                            toastLength: Toast.LENGTH_LONG,
                          );
                        }
                      },
                      controller: controller,
                      keyboardType: TextInputType.multiline,
                      readOnly: false,
                      maxLines: null,
                      style: themeOf.textTheme.bodyMedium,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    );
                  } else {
                    return Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        textProvider.translation,
                        style: themeOf.textTheme.bodyMedium,
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
