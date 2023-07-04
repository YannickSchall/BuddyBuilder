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
  List<ValueListenableBuilder<String>> additionalSets = [];
  List<bool> setCompleted = []; // Track completion status of each set
  bool expanded = false;
  int nextSet = 0;
  bool isFirstSetGroup = true; // Track if it's the first set group

  @override
  void initState() {
    super.initState();

    addSet(); // Call addSet() function once when the widget is created
  }

  void addSet() {
    setState(() {
      nextSet += 1;
      String inputReps = '';
      String inputKG = '';
      final valueNotifier = ValueNotifier('$nextSet');
      final valueListener = ValueListenableBuilder<String>(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          int setNr = int.parse(value);
          return Row(
            key: Key(nextSet.toString()),
            children: [
              if (!isFirstSetGroup) // Check if it's the first set group
                Container(
                  color: Colors.grey, // Separator line color
                  height: 1, // Separator line height
                ),
              Text('Set $setNr'),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  onChanged: (textValue) {
                    setState(() {
                      inputReps = textValue;
                    });
                  },
                  controller: TextEditingController(text: inputReps),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Reps',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  onChanged: (textValue) {
                    setState(() {
                      inputKG = textValue;
                    });
                  },
                  controller: TextEditingController(text: inputKG),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              (nextSet != 1)
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: (nextSet != 1) ? Colors.red : Colors.transparent,
                      ),
                      onPressed: () {
                        print("setNr: " + setNr.toString());
                        if (setNr != 1) {
                          setState(() {
                            nextSet -= 1;
                            additionalSets.removeAt(setNr - 1);
                            setCompleted.removeAt(setNr - 1);
                            correctSetNr(setNr - 1);
                          });
                        }
                      },
                      enableFeedback: (nextSet != 1) ? true : false,
                      splashColor: (nextSet != 1) ? null : Colors.transparent,
                    )
                  : const IconButton(
                      icon: Icon(Icons.close, color: Colors.transparent),
                      color: Colors.transparent,
                      onPressed: null,
                    ),
            ],
          );
        },
      );

      additionalSets.add(valueListener);
      setCompleted.add(false);
      isFirstSetGroup =
          false; // After adding the first set, it's no longer the first set group
    });
  }

  String getSetNr(int index) {
    if (additionalSets.isNotEmpty &&
        index >= 0 &&
        index < additionalSets.length) {
      final valueNotifier =
          additionalSets[index].valueListenable as ValueNotifier<String>;
      return valueNotifier.value;
    }

    return 'wrong index or empty list';
  }

  void updateSetValue(int index, String newValue) {
    if (additionalSets.isNotEmpty &&
        index >= 0 &&
        index < additionalSets.length) {
      final valueNotifier =
          additionalSets[index].valueListenable as ValueNotifier<String>;
      valueNotifier.value = newValue;
    }
  }

  void correctSetNr(int currSet) {
    for (var i = currSet; i < additionalSets.length; i++) {
      updateSetValue(i, (i + 1).toString());
    }
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
                if (!isFirstSetGroup) // Check if it's the first set group
                  Container(
                    color: Colors.grey, // Separator line color
                    height: 1, // Separator line height
                  ),
                Row(
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          onPressed: toggleExpanded,
                          child: Text(
                            widget.setTitle,
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
              ],
            ),
          ),
        ),
        if (expanded)
          Column(
            children: [
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
                      onPressed: () => widget.onPressed(widget.customId),
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
