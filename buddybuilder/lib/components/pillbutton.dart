import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buddybuilder/material_theme/buddy_colors.dart';

class PillButtonWidget extends StatelessWidget {
  const PillButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonheight = 60.0,
    this.buttonwidth = 300.0,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final EdgeInsets padding;
  final double buttonheight;
  final double buttonwidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      // Set the background color
      child: Container(
        width: buttonwidth,
        height: buttonheight,
        decoration: BoxDecoration(
          border: Border.all(
            color: mint,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: CupertinoButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ),
    );
  }
}
