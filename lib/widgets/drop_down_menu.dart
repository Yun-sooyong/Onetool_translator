import 'package:a_translator/provider/language_provider.dart';
import 'package:a_translator/provider/provider.dart';
import 'package:a_translator/theme.dart';
import 'package:a_translator/util.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DropdownLang extends StatefulWidget {
  const DropdownLang({
    super.key,
  });

  @override
  State<DropdownLang> createState() => _DropdownLangState();
}

class _DropdownLangState extends State<DropdownLang> {
  @override
  Widget build(BuildContext context) {
    final themeOf = themeData;

    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        borderRadius: boxRadius,
        color: themeOf.colorScheme.primary,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          var mProvider = ref.watch(mapProvider);
          final textProvider = ref.watch(textChangeNotifierProvider);

          return DropdownButtonHideUnderline(
            child: DropdownButton2(
              isExpanded: true,
              items: toList
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: themeOf.textTheme.bodySmall,
                        ),
                      ))
                  .toList(),

              // * 지금 바꾸면 items에 없는 내용이라 value에서 오류발생
              // TODOS 이후에 items를 변경하면 [ref.read(translateToProvider)]로 변경해놓을것
              value: mProvider.lang,
              onChanged: (value) {
                mProvider.searchCode(value!);
                textProvider.clear();
              },
              iconStyleData: IconStyleData(
                icon: const Icon(
                  BootstrapIcons.arrow_down_square,
                ),
                openMenuIcon: const Icon(BootstrapIcons.arrow_up_square),
                iconSize: 24,
                iconEnabledColor: themeOf.colorScheme.background,
                iconDisabledColor: Colors.grey,
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 250,
                // TODOS width 크기를 입력받도록 해서 사용성을 높힘
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: themeOf.colorScheme.primary.withOpacity(0.9),
                ),
                // TODOS width 수정할때 offset도 같이 수정
                offset: const Offset(-30, -20),
                scrollbarTheme: ScrollbarThemeData(
                  radius: const Radius.circular(40),
                  thickness: MaterialStateProperty.all(6),
                  thumbVisibility: MaterialStateProperty.all(true),
                ),
              ),
              menuItemStyleData: MenuItemStyleData(
                overlayColor:
                    MaterialStatePropertyAll(themeOf.colorScheme.primary),
                height: 60,
                padding: const EdgeInsets.only(left: 14, right: 14),
              ),
            ),
          );
        },
      ),
    );
  }
}

// * 새로 만든 Dropdown * //
class LanguageDropdown extends ConsumerWidget {
  const LanguageDropdown({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var langFinder = ref.watch(langFinderProvider.notifier);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      //width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        //color: themeData.colorScheme.primary,
        border: Border.all(
          color: themeData.colorScheme.primary,
          width: 2,
        ),
        borderRadius: boxRadius,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: toList
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                  ),
                ),
              )
              .toList(),
          value: ref.watch(langFinderProvider),
          onChanged: (value) {
            langFinder.setCodeState(value!);
          },
          iconStyleData: IconStyleData(
            icon: const Icon(BootstrapIcons.arrow_down_square),
            iconEnabledColor: themeData.colorScheme.primary,
            iconDisabledColor: Colors.grey[400],
            openMenuIcon: const Icon(BootstrapIcons.arrow_up_square),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: boxRadius,
            ),
            offset: const Offset(0, -10),
          ),
          menuItemStyleData: MenuItemStyleData(
            overlayColor: MaterialStatePropertyAll(
              themeData.colorScheme.background,
            ),
          ),
        ),
      ),
    );
  }
}

// * Dropdown Widget * //

class DropdownMenuBar extends StatefulWidget {
  final void Function(String lang) onChanged;
  final List<String> list;

  const DropdownMenuBar({
    super.key,
    required this.onChanged,
    required this.list,
  });

  @override
  State<DropdownMenuBar> createState() => _DropdownMenuBarState();
}

class _DropdownMenuBarState extends State<DropdownMenuBar> {
  late String selectedValue;
  @override
  void initState() {
    selectedValue = '한국어';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      //width: MediaQuery.of(context).size.width,
      // decoration: BoxDecoration(
      //   color: themeData.colorScheme.primary,
      //   border: Border.all(
      //     color: themeData.colorScheme.primary,
      //     width: 2,
      //   ),
      //   borderRadius: boxRadius,
      // ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2(
          isExpanded: true,
          items: widget.list
              .map(
                (item) => DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
            widget.onChanged(value!);
          },
          hint: const Text('Hint'),
          iconStyleData: IconStyleData(
            icon: const Icon(BootstrapIcons.arrow_down_square),
            iconEnabledColor: themeData.colorScheme.primary,
            iconDisabledColor: Colors.grey[400],
            openMenuIcon: const Icon(BootstrapIcons.arrow_up_square),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: boxRadius,
            ),
            offset: const Offset(0, -10),
          ),
          menuItemStyleData: MenuItemStyleData(
            overlayColor: MaterialStatePropertyAll(
              themeData.colorScheme.background,
            ),
          ),
        ),
      ),
    );
  }
}
