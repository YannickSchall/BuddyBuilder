import 'package:flutter/material.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/circle.dart';

class WeekDaySelector extends StatelessWidget {
  const WeekDaySelector({Key? key}) : super(key: key);

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
              text: 'MON',
            ),
            CircleWidget(
              onPressed: () {
                // Action for Tuesday button
              },
              text: 'TUE',
            ),
            CircleWidget(
              onPressed: () {
                // Action for Wednesday button
              },
              text: 'WED',
            ),
            CircleWidget(
              onPressed: () {
                // Action for Thursday button
              },
              text: 'THU',
            ),
          ],
        ),
        Row(
          children: [
            CircleWidget(
              onPressed: () {
                // Action for Friday button
              },
              text: 'FRI',
            ),
            CircleWidget(
              onPressed: () {
                // Action for Saturday button
              },
              text: 'SAT',
            ),
            CircleWidget(
              onPressed: () {
                // Action for Sunday button
              },
              text: 'SUN',
            ),
          ],
        ),
      ],
    );
  }
}
