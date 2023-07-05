import 'package:flutter/material.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/datewidget.dart';

class CircleWidget extends StatefulWidget {
  const CircleWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.padding = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
    this.width = 60,
    this.height = 60,
    this.isPressed = false,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Icon? icon;
  final double width;
  final double height;
  final EdgeInsets padding;
  final bool isPressed;

  @override
  _CircleWidgetState createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: widget.isPressed
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.secondaryContainer,
          shape: BoxShape.circle,
        ),
        child: TextButton(
          onPressed: () {
            if (!widget.isPressed) {
              // Only trigger onPressed if the button is not already pressed
              widget.onPressed();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) widget.icon!,
              Text(
                widget.text,
                style: TextStyle(
                  color: widget.isPressed
                      ? Colors.white
                      : Theme.of(context).colorScheme.primary,
                  fontFamily: 'Roboto',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
