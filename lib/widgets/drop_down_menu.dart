import 'package:a_translator/provider/provider.dart';
import 'package:a_translator/services/lang.dart';
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
    final themeOf = Theme.of(context);

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
              items: lang
                  .map((item) => DropdownMenuItem(
                        value: item,
                        child: Text(
                          item,
                          style: themeOf.textTheme.bodySmall,
                        ),
                      ))
                  .toList(),

              /// 지금 바꾸면 items에 없는 내용이라 value에서 오류발생
              /// TODO 이후에 items를 변경하면 [ref.read(translateToProvider)]로 변경해놓을것
              value: mProvider.lang,
              onChanged: (value) {
                mProvider.searchCode(value!);
                textProvider.clear();
                print(mProvider.code);
                print(mProvider.lang);

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
                // TODO width 크기를 입력받도록 해서 사용성을 높힘 
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: themeOf.colorScheme.primary.withOpacity(0.9),
                ),
                // TODO width 수정할때 offset도 같이 수정
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
