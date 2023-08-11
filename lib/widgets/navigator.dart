import 'package:a_translator/util.dart';
import 'package:a_translator/widgets/bottom_button.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoNavigator extends StatefulWidget {
  const GoNavigator({super.key, required this.index});

  final int index;

  @override
  State<GoNavigator> createState() => _GoNavigatorState();
}

class _GoNavigatorState extends State<GoNavigator> {
  bool isTyping = true;
  bool isVoice = false;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isTyping, isVoice];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = 195.0;

    toggleSelect(widget.index);

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomButton(
            color: choiceColor(0),
            isWide: true,
            width: width,
            icon: Icon(
              BootstrapIcons.keyboard,
              color: choiceColor(0),
            ),
            label: Text(
              'Typing',
              style: TextStyle(
                color: choiceColor(0),
              ),
            ),
            onTap: () {
              context.go('/');
            },
          ),
          BottomButton(
            color: choiceColor(1),
            isWide: true,
            width: width,
            icon: Icon(
              BootstrapIcons.mic,
              color: choiceColor(1),
            ),
            label: Text(
              'Voice',
              style: TextStyle(
                color: choiceColor(1),
              ),
            ),
            onTap: () {
              context.go('/stt');
            },
          ),
        ],
      ),
    );
  }

  void toggleSelect(value) {
    if (value == 0) {
      isTyping = true;
      isVoice = false;
    } else {
      isTyping = false;
      isVoice = true;
    }
    setState(() {
      isSelected = [isTyping, isVoice];
    });
  }

  Color choiceColor(index) {
    return isSelected[index] == true ? selectedColor : unSelectedColor;
  }
}
