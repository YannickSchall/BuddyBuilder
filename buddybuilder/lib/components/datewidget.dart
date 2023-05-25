import 'package:flutter/material.dart';

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
        children: [
          Container(
            child: Text(
              currentWeekday,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            child: Text(
              currentDay,
              style: const TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
    );
  }
}
