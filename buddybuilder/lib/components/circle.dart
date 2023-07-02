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
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Icon? icon;
  final double width;
  final double height;
  final EdgeInsets padding;

  @override
  _CircleWidgetState createState() => _CircleWidgetState();
}

class _CircleWidgetState extends State<CircleWidget> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: _isPressed
              ? Theme.of(context).colorScheme.secondary
              : Theme.of(context).colorScheme.secondaryContainer,
          shape: BoxShape.circle,
        ),
        child: TextButton(
          onPressed: () {
            setState(() {
              _isPressed = !_isPressed;
            });
            widget.onPressed();
            if (_isPressed) {
              // Call a function to display 7 circle buttons
              // Function implementation goes here
              print('Display 7 circle buttons');
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (widget.icon != null) widget.icon!,
              Text(
                widget.text,
                style: TextStyle(
                  color: _isPressed
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
