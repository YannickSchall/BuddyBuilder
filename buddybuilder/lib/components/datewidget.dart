import 'package:flutter/material.dart';

/* This is the DateWidget-Component fit to our needs
-  to create todays Date and Weekday on the HomeView as an Icon
*/

class DayMonthWidget extends StatelessWidget {
  const DayMonthWidget({Key? key}) : super(key: key);

  String getDayName(int day) {
    final weekdayNames = [
      '', // Index 0 is left empty since months start from 1
      'MON',
      'TUE',
      'WED',
      'THU',
      'FRI',
      'SAT',
      'SUN',
    ];
    return weekdayNames[day];
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentDay = DateTime.now().day.toString();
    //final currentMonth = getMonthName(now.month); // Format month as name
    final currentWeekday = getDayName(DateTime.now().weekday);

    return SizedBox(
      width: 60,
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              currentWeekday,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
          Container(
            child: Text(
              currentDay,
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
          ),
        ],
      ),
    );
  }
}
