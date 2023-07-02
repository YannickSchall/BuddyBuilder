import 'package:buddybuilder/pages/create_plan/04_set/set_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import '../../../main.dart';

class SetButtonValue {
  String reps;
  String weights;

  SetButtonValue({required this.reps, required this.weights});
}

class SetView extends StatefulWidget {
  const SetView({Key? key}) : super(key: key);

  @override
  _SetViewState createState() => _SetViewState();
}

class _SetViewState extends State<SetView> {
  List<SetButtonValue> pillButtons = [
    SetButtonValue(reps: '', weights: ''),
  ];

  void addButton() {
    setState(() {
      pillButtons.add(SetButtonValue(reps: '', weights: ''));
    });
  }

  void updateButtonValue(String value, int setIndex, bool isReps) {
    setState(() {
      if (isReps) {
        pillButtons[setIndex].reps = value;
      } else {
        pillButtons[setIndex].weights = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GymAppBar(
        subTitle: 'BUILD SET',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: true,
        onBackButtonPressed: () => Navigator.pushNamed(context, '/workout'),
        onOkButtonPressed: () => Navigator.pushNamed(context, '/workout'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PillButtonWidget(
                onPressed: addButton,
                text: 'Add set',
                icon: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pillButtons.length,
                itemBuilder: (context, setIndex) {
                  SetButtonValue buttonValues = pillButtons[setIndex];
                  return Container(
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.black, width: 2),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: PillButtonWidget(
                            onPressed: () {
                              TextEditingController textController =
                                  TextEditingController(
                                      text: buttonValues.reps);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Enter value'),
                                    content: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: textController,
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          final String value =
                                              textController.text;
                                          if (value.isNotEmpty) {
                                            updateButtonValue(
                                                value, setIndex, true);
                                          }
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: buttonValues.reps.isEmpty
                                ? 'Reps'
                                : 'x ' + buttonValues.reps,
                            swipeToDelete: true,
                          ),
                        ),
                        const SizedBox(width: 2),
                        Expanded(
                          child: PillButtonWidget(
                            onPressed: () {
                              TextEditingController textController =
                                  TextEditingController(
                                      text: buttonValues.weights);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Enter value'),
                                    content: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: textController,
                                    ),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text('OK'),
                                        onPressed: () {
                                          final String value =
                                              textController.text;
                                          if (value.isNotEmpty) {
                                            updateButtonValue(
                                                value, setIndex, false);
                                          }
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            text: buttonValues.weights.isEmpty
                                ? 'Weights'
                                : buttonValues.weights + ' kg',
                            swipeToDelete: true,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class SetController extends StateNotifier<ExerciseSet> {
  SetController(ExerciseSet state) : super(state);
}
