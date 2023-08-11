import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/bottom_button.dart';
import 'package:a_translator/widgets/drop_down_menu.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '/widgets/text_box_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var themeOf = Theme.of(context);

    return Scaffold(
      backgroundColor: themeOf.colorScheme.background,
      extendBody: true,
      appBar: AppBar(
        title: const Text(
          'translator',
        ),
        leading: const Icon(
          BootstrapIcons.list,
          size: 30,
        ),
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
              flex: 8,
              child: MiddleBody(themeOf: themeOf),
            ),
            const Expanded(
              flex: 2,
              child: Hero(
                tag: 'bottomBody',
                child: BottomBody(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///
/// Bottom Buttons Body
///
class BottomBody extends StatelessWidget {
  const BottomBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BottomButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(BootstrapIcons.keyboard),
            label: const Text('Typing'),
            onTap: () {
              context.go('/');
            },
          ),
          BottomButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(BootstrapIcons.mic),
            label: const Text('Voice'),
            onTap: () {
              context.go('/stt');
            },
          ),
          BottomButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(BootstrapIcons.camera),
            label: const Text('Camera'),
            onTap: () {
              context.go('/new');
            },
          ),
          BottomButton(
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(BootstrapIcons.image),
            label: const Text('Image'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

///
/// UPPER BODY PART
///
// class TopBody extends StatelessWidget {
//   const TopBody({super.key, required this.themeOf});

//   final ThemeData themeOf;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: boxRadius,
//         color: themeOf.colorScheme.primary,
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Expanded(
//             flex: 3,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Container(),
//             ),
//           ),
//           Expanded(
//             child: Icon(
//               BootstrapIcons.arrow_left_right,
//               color: themeOf.colorScheme.background,
//               size: 20,
//             ),
//           ),
//           Expanded(
//             flex: 3,
//             child: DropdownMenu(
//               //controller: sndLang,
//               trailingIcon: Icon(
//                 BootstrapIcons.arrow_down_short,
//                 color: themeOf.colorScheme.background,
//               ),
//               selectedTrailingIcon: Icon(
//                 BootstrapIcons.arrow_up_short,
//                 color: themeOf.colorScheme.background,
//               ),
//               dropdownMenuEntries: const [],
//               inputDecorationTheme: InputDecorationTheme(
//                 border: InputBorder.none,
//                 iconColor: themeOf.colorScheme.background,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

///
/// Input Textfield and translation text view part
///
class MiddleBody extends StatelessWidget {
  const MiddleBody({
    super.key,
    required this.themeOf,
  });

  final ThemeData themeOf;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        //var mProvider = ref.watch(mapProvider);

        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: Column(
            children: [
              Expanded(
                child: TextBox(
                  isTextField: true,
                ),
              ),
              Expanded(
                child: TextBox(
                  isTextField: false,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
