import 'package:flutter/material.dart';
import 'package:buddybuilder/components/pillbutton.dart';

class SetWidget extends StatefulWidget {
  const SetWidget({
    Key? key,
    required this.setTitle,
    required this.setNumber,
    required this.kgValue,
    required this.repsValue,
  }) : super(key: key);

  final String setTitle;
  final int setNumber;
  final String kgValue;
  final String repsValue;

  @override
  _SetWidgetState createState() => _SetWidgetState();
}

class _SetWidgetState extends State<SetWidget> {
  List<Widget> additionalSets = [];
  List<bool> setCompleted = []; // Track completion status of each set
  bool expanded = false;

  void addSet() {
    setState(() {
      final nextSetNumber = widget.setNumber + 1;
      additionalSets.add(
        Row(
          children: [
            Text('Set $nextSetNumber:'),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Reps',
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Weight',
                ),
              ),
            ),
            SizedBox(width: 8),
            IconButton(
              icon: Icon(
                setCompleted.length > nextSetNumber &&
                        setCompleted[nextSetNumber]
                    ? Icons.check_circle
                    : Icons.check_circle_outline,
              ),
              color: Theme.of(context).colorScheme.onPrimary,
              onPressed: () {
                setState(() {
                  if (setCompleted.length > nextSetNumber) {
                    setCompleted[nextSetNumber] = !setCompleted[nextSetNumber];
                  } else {
                    setCompleted.add(true);
                  }
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
                        child: expanded
                            ? TextButton(
                                onPressed: toggleExpanded,
                                child: Text(
                                  widget.setTitle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              )
                            : TextButton(
                                onPressed: toggleExpanded,
                                child: Text(
                                  widget.setTitle,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
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
                  Text('Set ${widget.setNumber}:'),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Reps',
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Weight',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      setCompleted.length > widget.setNumber &&
                              setCompleted[widget.setNumber]
                          ? Icons.check_circle
                          : Icons.check_circle_outline,
                    ),
                    color: Theme.of(context).colorScheme.onPrimary,
                    onPressed: () {
                      setState(() {
                        if (setCompleted.length > widget.setNumber) {
                          setCompleted[widget.setNumber] =
                              !setCompleted[widget.setNumber];
                        } else {
                          setCompleted.add(true);
                        }
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 8),
              ...additionalSets,
              PillButtonWidget(
                onPressed: addSet,
                text: 'Add Set',
                buttonHeight: 20,
                buttonWidth: 100,
              ),
            ],
          ),
      ],
    );
  }
}
