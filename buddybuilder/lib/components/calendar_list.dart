import 'package:flutter/material.dart';

class CalendarListWidget extends StatefulWidget {
  CalendarListWidget({
    Key? key,
    required this.name,
    required this.id,
    required this.setData,
  }) : super(key: key);

  final String name;
  final int id;
  List<Map<String, String>> setData;

  @override
  _CalendarListWidgetState createState() => _CalendarListWidgetState();
}

class _CalendarListWidgetState extends State<CalendarListWidget> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
              ],
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.setData.length,
              itemBuilder: (context, index) {
                final set = widget.setData[index];

                return Column(
                  children: [
                    Row(
                      children: [
                        Text('Set ${set['set']}'),
                        const SizedBox(width: 16),
                        Text('Reps ${set['reps']}'),
                        const SizedBox(width: 16),
                        Text('Kg ${set['kg']}'),
                      ],
                    ),
                    if (index == widget.setData.length - 1)
                      Divider(), // Add a divider under the last set
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
