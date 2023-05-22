import 'package:flutter/material.dart';

class DayMonthWidget extends StatelessWidget {
  const DayMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final currentDay = DateTime.now().day.toString();
    final currentMonth = DateTime.now().month.toString();

    return Container(
      width: 50,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.withOpacity(0.3),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(currentDay),
          SizedBox(height: 8.0),
          SizedBox(height: 8.0),
          Text(currentMonth),
        ],
      ),
    );
  }
}
