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

    return Container(
      width: 150,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16.0),
      child: Container(
        //crossAxisAlignment: CrossAxisAlignment.center,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Column(
          children: [
            Container(
              //alignment: Alignment.centerLeft,
              //padding: const EdgeInsets.only(left: 16.0),
              child: Text(currentWeekday),
            ),
            Container(
              //alignment: Alignment.centerLeft,
              child: Text(currentDay),
            ),
            //SizedBox(height: 8.0, width: 32),
            //SizedBox(height: 8.0, width: 32),
            Container(
              //alignment: Alignment.centerLeft,
              child: Icon(Icons.calendar_month),
            ),
          ],
        ),
      ),
    );
  }
}
