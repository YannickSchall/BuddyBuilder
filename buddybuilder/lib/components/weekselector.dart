import 'package:flutter/material.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/circle.dart';

class WeekSelector extends StatelessWidget {
  const WeekSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleWidget(
              onPressed: () {
                // Action for Monday button
              },
              text: '1',
            ),
          ],
        ),
      ],
    );
  }
}
