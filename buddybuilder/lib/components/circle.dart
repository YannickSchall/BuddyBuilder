import 'package:flutter/material.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/datewidget.dart';

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.width = 20,
    this.height = 20,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Icon? icon;
  final double width;
  final double height;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondaryContainer,
          shape: BoxShape.circle,
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) icon!,
              Text(
                text,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink,
                  //color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
