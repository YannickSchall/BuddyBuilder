import 'package:flutter/material.dart';

class ExerciseWidget extends StatefulWidget {
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
        decoration: BoxDecoration(),
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        expanded = !expanded;
                      });
                    },
                    child: Flexible(
                      child: Container(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        child: const Text(
                          'Latpulldown',
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        '5x5',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          completed
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                        ),
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
                          children: const [Text('Set 1')])),
                  Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [Container(child: Text('1x12'))])),
                  IconButton(
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
            const Divider(
              //height: 20,
              thickness: 1,
              //indent: 20,
              endIndent: 0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
