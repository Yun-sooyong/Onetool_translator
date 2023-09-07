import 'package:a_translator/util.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final Text label;
  final Icon icon;
  final Function() onTap;
  final double width;
  final double height;
  final bool isWide;
  final Color color;

  const BottomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
    this.width = 70,
    this.height = 70,
    this.isWide = false,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: boxRadius,
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                border: Border.all(
                  color: color,
                ),
                borderRadius: boxRadius,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: icon,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  isWide ? label : const SizedBox(),
                ],
              ),
            ),
            SizedBox(
              height: isWide ? 0 : 5,
            ),
            isWide ? const SizedBox.shrink() : label,
          ],
        ),
      ),
    );
  }
}
