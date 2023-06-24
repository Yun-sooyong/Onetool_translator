import 'package:a_translator/util.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final Icon icon;
  final Function() onTap;

  const BottomButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: boxRadius,
      elevation: 0,
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: boxRadius,
              ),
              child: Center(
                child: icon,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      ),
    );
  }
}
