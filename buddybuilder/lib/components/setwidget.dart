import 'package:flutter/material.dart';
import 'package:buddybuilder/components/pillbutton.dart';

class SetWidget extends StatefulWidget {
  SetWidget({
    Key? key,
    required this.setTitle,
    this.setNumber = 0,
    required this.kgValue,
    required this.repsValue,
    required this.onPressed,
    this.customId = 0,
  }) : super(key: key);

  final String setTitle;
  int setNumber;
  final String kgValue;
  final String repsValue;
  void Function(int) onPressed;
  int customId;

  @override
  State<StatefulWidget> createState() => _SetWidgetState();
}

class _SetWidgetState extends State<SetWidget> {
  List<Widget> additionalSets = [];
  List<bool> setCompleted = []; // Track completion status of each set
  bool expanded = false;
  int nextSet = 1;

  void addSet() {
    setState(() {
      nextSet += 1;

      additionalSets.add(
        Row(
          children: [
            Text('Set $nextSet'),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Reps',
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Weight',
                ),
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
              onPressed: () {
                setState(() {
                  nextSet -= 1;
                  additionalSets.removeLast();
                  setCompleted.removeLast();
                });
              },
            ),
          ],
        ),
      );
      setCompleted.add(false);
    });
  }

  void toggleExpanded() {
    setState(() {
      expanded = !expanded;
    });
  }

  void deleteAll() {
    setState(() {
      additionalSets.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: toggleExpanded,
          child: Container(
            color: Colors.transparent,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: toggleExpanded,
                          child: Text(
                            widget.setTitle ,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        expanded ? Icons.expand_less : Icons.expand_more,
                      ),
                      onPressed: toggleExpanded,
                    ),
                  ],
                ),
                if (!expanded)
                  Container(
                    color: Colors.grey, // Separator line color
                    height: 1, // Separator line height
                  ),
              ],
            ),
          ),
        ),
        if (expanded)
          Column(
            children: [
              Row(
                children: [
                  Text('Set ${widget.setNumber + 1}'),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Reps',
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Weight',
                      ),
                    ),
                  ),
                  if (widget.setNumber > 1)
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        setState(() {
                          additionalSets.removeAt(widget.setNumber - 2);
                          setCompleted.removeAt(widget.setNumber - 2);
                        });
                      },
                    )
                  else
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.transparent,
                      ),
                      onPressed: () {},
                    ),
                ],
              ),
              const SizedBox(height: 8),
              ...additionalSets,
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    PillButtonWidget(
                      onPressed: addSet,
                      text: 'Add Set',
                      buttonHeight: 20,
                      buttonWidth: 100,
                    ),
                    const SizedBox(width: 8),
                    PillButtonWidget(
                      onPressed: () => widget.onPressed(widget.customId), // Using the provided callback
                      text: 'Delete Exercise',
                      buttonHeight: 20,
                      buttonWidth: 200,
                    ),
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
