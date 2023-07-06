import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:buddybuilder/components/datewidget.dart';

/* This is the Gymbar-Component fit to our needs
-  to display the title different title options of excerciseTitle and subtitle as they have different placement
-  tp display the option of having navigation (ok and back) buttons 
*/

class GymAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GymAppBar({
    Key? key,
    this.title,
    this.excerciseTitle,
    this.subTitle,
    this.date,
    required this.titleAlignment,
    required this.showBackButton,
    required this.showOkButton,
    required this.onBackButtonPressed,
    required this.onOkButtonPressed,
  }) : super(key: key);

  final String? title;
  final String? excerciseTitle;
  final String? subTitle;
  final String? date;
  final bool showBackButton;
  final bool showOkButton;
  final VoidCallback onBackButtonPressed;
  final VoidCallback onOkButtonPressed;
  final Alignment titleAlignment;
  final dateWidget = const DayMonthWidget();

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(children: [
        Container(
          alignment: Alignment.centerRight,
          child: excerciseTitle == null
              ? title != null
                  ? Text(title!)
                  : Container(
                      alignment: Alignment.center,
                      child: Text(
                        subTitle!,
                        textAlign: TextAlign.center,
                      ))
              : Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    excerciseTitle!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    textWidthBasis: TextWidthBasis.longestLine,
                  ),
                  Text(
                      dateWidget.getDayName(DateTime.now().weekday) +
                          " " +
                          DateTime.now().day.toString(),
                      style: const TextStyle(
                          fontSize: 27, fontWeight: FontWeight.normal))
                ]),
        ),
      ]),
      toolbarHeight: double.infinity,
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontFamily: 'Roboto',
          fontSize: 36,
          fontWeight: FontWeight.bold),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackButtonPressed,
              color: Theme.of(context).colorScheme.primary)
          : null,
      actions: [
        showOkButton
            ? IconButton(
                icon: const Icon(Icons.check),
                onPressed: onOkButtonPressed,
                color: Theme.of(context).colorScheme.primary)
            : IconButton(
                icon: const Icon(Icons.check),
                onPressed: onOkButtonPressed,
                color: Theme.of(context).colorScheme.secondaryContainer),
      ],
    );
  }
}
