import 'package:flutter/material.dart';

class ExerciseWidget extends StatefulWidget {
  const ExerciseWidget({
    Key? key,
    this.setCount,
    this.totalCount,
    this.icon,
  }) : super(key: key);

  final String? setCount;
  final String? totalCount;
  final Icon? icon;

  @override
  _ExerciseWidgetState createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  bool expanded = false;
  bool completed = false;
  bool innerCompleted = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          expanded = !expanded;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    child: Text(
                      'Single Arm Latpull Down Seilzug Reverse Incline Angle',
                      overflow: TextOverflow.visible,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '5x5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          completed
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                        ),
                        color: Theme.of(context).colorScheme.onPrimary,
                        onPressed: () {
                          setState(() {
                            completed = !completed;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (expanded)
              Row(
                children: [
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Text(
                          'Set 1',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ])),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                        Text(
                          '1x12',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                      ])),
                  IconButton(
                    color: Theme.of(context).colorScheme.onPrimary,
                    icon: Icon(
                      innerCompleted
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                    ),
                    onPressed: () {
                      setState(() {
                        innerCompleted = !innerCompleted;
                      });
                    },
                  ),
                ],
              ),
            Divider(
              thickness: 1,
              height: 10,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
