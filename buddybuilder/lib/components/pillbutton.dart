import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buddybuilder/material_theme/buddy_colors.dart';
import 'package:buddybuilder/components/datewidget.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

class PillButtonWidget extends StatelessWidget {
  const PillButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.buttonHeight = 60.0,
    this.buttonWidth = 300.0,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    this.icon,
    this.dateWidget,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String text;
  final EdgeInsets padding;
  final double buttonHeight;
  final double buttonWidth;
  final Icon? icon;
  final DayMonthWidget? dateWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          //border: Border.all(
          //  color: Theme.of(context).colorScheme.primaryContainer,
          //  width: 2.0,
          //),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: CupertinoButton(
          onPressed: onPressed,
          color: Theme.of(context).colorScheme.primary,
          pressedOpacity: 0.3,
          padding: EdgeInsets.zero,
          borderRadius: BorderRadius.circular(24.0),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 16.0),
                child: ((icon != null) || (dateWidget != null))
                    ? Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                        child: (dateWidget != null) ? dateWidget : icon,
                      )
                    : Container(),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
