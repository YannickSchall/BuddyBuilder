import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buddybuilder/components/pillbutton.dart';

class ContainerButtonWidget extends StatelessWidget {
  const ContainerButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.icon,
    this.outerWidth = 300.0,
    this.outerHeight = 200.0,
    this.innerWidth = 200.0,
    this.innerHeight = 60.0,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final Icon? icon;
  final double outerWidth;
  final double outerHeight;
  final double innerWidth;
  final double innerHeight;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: outerWidth,
        height: outerHeight,
        decoration: BoxDecoration(
          color: Colors.black, // Set the background color
          border: Border.all(
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(innerHeight / 2),
        ),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: PillButtonWidget(
                  onPressed: onPressed,
                  text: text,
                  buttonHeight: 70,
                  buttonWidth: 250.0,
                ),
              ),
            ),
            Expanded(
              child: Container(), // Add an empty container for the lower row
            ),
          ],
        ),
      ),
    );
  }
}
