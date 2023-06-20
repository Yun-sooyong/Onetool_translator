import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/bottom_button.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    DropdownMenu(
                      dropdownMenuEntries: const [],
                      inputDecorationTheme: InputDecorationTheme(
                        iconColor: themeOf.colorScheme.background,
                        prefixIconColor: themeOf.colorScheme.background,
                        suffixIconColor: themeOf.colorScheme.background,
                        fillColor: themeOf.colorScheme.background,
                      ),
                    ),
                    Icon(
                      BootstrapIcons.arrow_left_right,
                      color: themeOf.colorScheme.background,
                      size: 20,
                    ),
                    const DropdownMenu(dropdownMenuEntries: []),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: boxEdge,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  themeOf.colorScheme.primary.withOpacity(0.6),
                              width: 2,
                            ),
                            borderRadius: boxRadius,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: boxEdge,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color:
                                  themeOf.colorScheme.primary.withOpacity(0.6),
                              width: 2,
                            ),
                            borderRadius: boxRadius,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                      icon: const Icon(BootstrapIcons.activity),
                      label: 'Typing',
                      onTap: () {},
                    ),
                    BottomButton(
                      icon: const Icon(BootstrapIcons.activity),
                      label: 'Voice',
                      onTap: () {},
                    ),
                    BottomButton(
                      icon: const Icon(BootstrapIcons.activity),
                      label: 'Camera',
                      onTap: () {},
                    ),
                    BottomButton(
                      icon: const Icon(BootstrapIcons.activity),
                      label: 'Picture',
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
