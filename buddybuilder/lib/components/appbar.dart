import 'package:flutter/material.dart';

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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(alignment: titlealignment, child: Text(customdata)),
      titleTextStyle: const TextStyle(
          color: Colors.green,
          fontFamily: 'Roboto',
          fontSize: 36,
          fontWeight: FontWeight.bold),
      leading: showBackButton
          ? IconButton(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackButtonPressed,
            )
          : null,
      actions: [
        if (showOkButton)
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: onOkButtonPressed,
          ),
      ],
    );
  }
}
