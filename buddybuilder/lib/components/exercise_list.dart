import 'package:flutter/material.dart';

class ExerciseWidget extends StatefulWidget {
  const ExerciseWidget(
      {Key? key, this.icon, required this.onPressed, required this.name})
      : super(key: key);

  final Icon? icon;
  final Function(String) onPressed;
  final String name;

  @override
  _ExerciseWidgetState createState() => _ExerciseWidgetState();
}

class _ExerciseWidgetState extends State<ExerciseWidget> {
  bool completed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: GestureDetector(
                    child: Text(
                      widget.name,
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
                      IconButton(
                        icon: Icon(
                          completed
                              ? Icons.check_circle
                              : Icons.check_circle_outline,
                        ),
                        color: Theme.of(context).colorScheme.onPrimary,
                        onPressed: widget.onPressed(widget.name),
                      ),
                    ],
                  ),
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
