import 'package:flutter/material.dart';
import 'package:buddybuilder/components/circle.dart';

/* This is the WeekDaySelector-Component fit to our needs
-  to display CircleButtons with the correct weekday
*/

class WeekDaySelector extends StatefulWidget {
  final void Function(String?) onDaySelected;

  const WeekDaySelector({
    Key? key,
    required this.onDaySelected,
  }) : super(key: key);

  @override
  _WeekDaySelectorState createState() => _WeekDaySelectorState();
}

class _WeekDaySelectorState extends State<WeekDaySelector> {
  String? _selectedDay = 'MON';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleWidget(
              onPressed: () {
                _updateSelectedDay('MON');
              },
              text: 'MON',
              isPressed: _selectedDay == 'MON',
            ),
            CircleWidget(
              onPressed: () {
                _updateSelectedDay('TUE');
              },
              text: 'TUE',
              isPressed: _selectedDay == 'TUE',
            ),
            CircleWidget(
              onPressed: () {
                _updateSelectedDay('WED');
              },
              text: 'WED',
              isPressed: _selectedDay == 'WED',
            ),
            CircleWidget(
              onPressed: () {
                _updateSelectedDay('THU');
              },
              text: 'THU',
              isPressed: _selectedDay == 'THU',
            ),
          ],
        ),
        Row(
          children: [
            CircleWidget(
              onPressed: () {
                _updateSelectedDay('FRI');
              },
              text: 'FRI',
              isPressed: _selectedDay == 'FRI',
            ),
            CircleWidget(
              onPressed: () {
                _updateSelectedDay('SAT');
              },
              text: 'SAT',
              isPressed: _selectedDay == 'SAT',
            ),
            CircleWidget(
              onPressed: () {
                _updateSelectedDay('SUN');
              },
              text: 'SUN',
              isPressed: _selectedDay == 'SUN',
            ),
          ],
        ),
      ],
    );
  }

/*
_updateSelectedDay()
makes sure only one circle is selectable at a time (adding toggle-button functionality)
*/
  void _updateSelectedDay(String day) {
    setState(() {
      if (_selectedDay == day) {
        _selectedDay = null;
      } else {
        _selectedDay = day;
      }
    });

    widget.onDaySelected(_selectedDay);
  }
}
