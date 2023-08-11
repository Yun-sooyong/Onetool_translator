import 'package:a_translator/util.dart';
import 'package:flutter/material.dart';

// ******* TextField, Text 를 넣기위한 Box Widget ******* //

class TextBoxWidget extends StatelessWidget {
  const TextBoxWidget({
    super.key,
    required this.actions,
    required this.child,
    this.title = 'title',
  });

  final List<Widget> actions;
  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: boxMargin,
      padding: boxPadding,
      decoration: BoxDecoration(
        borderRadius: boxRadius,
        border: Border.all(
          color: mColor,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          // * Box title, action buttons //
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: actions,
              ),
            ],
          ),

          const SizedBox(
            height: 10,
          ),
          // * Main Body //
          Expanded(
            child: child,
          ),
        ],
      ),
    );
  }
}
