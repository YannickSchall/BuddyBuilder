import 'package:flutter/material.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

class GymAppBar extends StatelessWidget implements PreferredSizeWidget {
  const GymAppBar({
    Key? key,
    required this.customdata,
    required this.titlealignment,
    required this.showBackButton,
    required this.showOkButton,
    required this.onBackButtonPressed,
    required this.onOkButtonPressed,
  }) : super(key: key);

  final String customdata;
  final bool showBackButton;
  final bool showOkButton;
  final VoidCallback onBackButtonPressed;
  final VoidCallback onOkButtonPressed;
  final Alignment titlealignment;

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        //height: 100, // Adjust the vertical padding as needed
        padding: EdgeInsets.zero,
        child: Align(
          alignment: titlealignment,
          child: Text(customdata),
        ),
      ),
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
        if (showOkButton)
          IconButton(
              icon: const Icon(Icons.check),
              onPressed: onOkButtonPressed,
              color: Theme.of(context).colorScheme.primary),
      ],
    );
  }
}
