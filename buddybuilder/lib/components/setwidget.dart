import 'package:flutter/material.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/services/db/db_service.dart';

import '../services/db/collections/split.dart';

class SetWidget extends StatefulWidget {
  SetWidget(
      {Key? key,
      required this.setTitle,
      this.setNumber = 0,
      required this.kgValues,
      required this.repsValues,
      required this.exSets,
      required this.onPressed,
      this.customId = 0,
      required this.splitID,
      required this.exerciseID,
      required this.db})
      : super(key: key);

  final String setTitle;
  int setNumber;
  Map<int, String> kgValues;
  Map<int, String> repsValues;
  void Function(int) onPressed;
  Map<int, ExSet> exSets;
  int customId;
  int splitID;
  int exerciseID;
  DBService db;

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
    //List<String> _kgValues = widget.kgValues;
    //List<String> _repsValues = widget.repsValues;
    final l = widget.exSets.length;
    if (l == 0) {
      addSet();
    }
    for (var i = 0; i < l; i++) {
      addSet();
    }
    // Call addSet() function once when the widget is created
  }

  void addSet() {
    setState(() {
      nextSet += 1;
      final valueNotifier = ValueNotifier('$nextSet');
      final valueListener = ValueListenableBuilder<String>(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          int setNr = int.parse(value);
          int index = setNr - 1;

          ExSet firstSet = ExSet()
            ..id = index
            ..kg = 0
            ..reps = 0;
          widget.exSets[index] = firstSet;

          //widget.db.addSetToExercise(widget.splitID, widget.exerciseID, firstSet); //?
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
                      int index = setNr - 1;
                      widget.repsValues[index] = textValue;
                      int reps = int.parse(textValue);
                      updateSetReps(reps, index);
                    });
                  },
                  //onEditingComplete: () {
                  //  int index = setNr - 1;
                  //  int reps = int.parse(widget.repsValues[index]);
                  //  updateSetReps(reps, index);
                  //},
                  controller:
                      TextEditingController(text: widget.repsValues[setNr - 1]),
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
                      textValue = textValue.replaceAll(',', '.');
                      int index = setNr - 1;
                      widget.kgValues[index] = textValue;
                      double kg = double.parse(textValue);
                      updateSetKG(kg, index);
                    });
                  },
                  //onEditingComplete: () {
                  //  int index = setNr - 1;
                  //  double kg = double.parse(widget.kgValues[index]);
                  //  updateSetKG(kg, index);
                  //},
                  controller:
                      TextEditingController(text: widget.kgValues[setNr - 1]),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Weight',
                  ),
                ),
              ),
              const SizedBox(width: 8),
              (setNr != 1)
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        color: (nextSet != 1) ? Colors.red : Colors.transparent,
                      ),
                      onPressed: () {
                        if (setNr != 1) {
                          setState(() {
                            nextSet -= 1;
                            additionalSets.removeAt(setNr - 1);
                            setCompleted.removeAt(setNr - 1);
                            correctSetNr(setNr - 1);
                            widget.exSets.remove(nextSet);
                            //widget.db.removeSetFromExercise(widget.splitID, widget.exerciseID, setNr);
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

  void updateSetKG(double kg, int index) {
    int id = widget.exSets[index]!.id;
    int reps = widget.exSets[index]!.reps;
    widget.exSets[index] = ExSet()
      ..id = id
      ..reps = reps
      ..kg = kg;
  }

  ExSet createExSetforIndex(int index) {
    double kg = double.parse(widget.kgValues[index]!);
    int reps = int.parse(widget.repsValues[index]!);

    ExSet exSet = ExSet()
      ..id = index
      ..kg = kg
      ..reps = reps;

    return exSet;
  }

  void updateSetReps(int reps, int index) {
    int id = widget.exSets[index]!.id;
    double kg = widget.exSets[index]!.kg;
    widget.exSets[index] = ExSet()
      ..id = id
      ..reps = reps
      ..kg = kg;
  }

  void correctSetNr(int currSet) {
    for (var i = currSet; i < additionalSets.length; i++) {
      updateSetValue(i, (i + 1).toString());
    }
  }

  void updateSetInDB(List<ExSet> exSet) {
    widget.db.updateSetinExercise(widget.splitID, widget.exerciseID, exSet);
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
                if (!isFirstSetGroup)
                  Container(
                    color: Colors.grey,
                    height: 1,
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
                    PillButtonWidget(
                      onPressed: () {
                        //for (var exSet in widget.exSets.values) {
                        widget.db.updateSetinExercise(widget.splitID, widget.exerciseID, widget.exSets.values.toList());
                        //}
                      },
                      text: "Save",
                      buttonHeight: 20,
                      buttonWidth: 70,
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
