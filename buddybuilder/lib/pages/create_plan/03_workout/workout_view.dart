import 'package:buddybuilder/pages/create_plan/03_workout/workout_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import '../../../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WorkoutView extends StatefulWidget {
  const WorkoutView({Key? key}) : super(key: key);

  @override
  _WorkoutViewState createState() => _WorkoutViewState();
}

void createNewPillButton(List<String> pillButtons, Function(String) addButton) {
  TextEditingController textController = TextEditingController();

  showDialog(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Button Text'),
        content: TextField(
          controller: textController,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('Ok'),
            onPressed: () {
              final String buttonText = textController.text;
              if (buttonText.isNotEmpty) {
                addButton(buttonText);
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

class _WorkoutViewState extends State<WorkoutView> {
  List<PillButtonData> pillButtonsWorkout = [];
  int nextButtonId = 0;

  @override
  void initState() {
    super.initState();
    _loadButtonData();
  }

  void _loadButtonData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? buttonDataWorkoutList =
        prefs.getStringList('buttonDataWorkout');

    if (buttonDataWorkoutList != null) {
      setState(() {
        pillButtonsWorkout = buttonDataWorkoutList.map((data) {
          final parts = data.split(':');
          final buttonId = int.parse(parts[0]);
          final buttonText = parts[1];
          return PillButtonData(buttonId, buttonText);
        }).toList();
      });
    }
  }

  void _saveButtonData() async {
    final List<String> buttonDataWorkoutList =
        pillButtonsWorkout.map((datasplit) {
      return '${datasplit.id}:${datasplit.text}';
    }).toList();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('buttonDataWorkout', buttonDataWorkoutList);
  }

  void addButton(String buttonText) {
    setState(() {
      final buttonData = PillButtonData(nextButtonId, buttonText);
      pillButtonsWorkout.add(buttonData);
      nextButtonId++;
    });
    _saveButtonData();
  }

  void removeButton(int buttonId) {
    setState(() {
      pillButtonsWorkout.removeWhere((button) => button.id == buttonId);
    });
    _saveButtonData();
  }

  void updateRoute() {
    Navigator.pushNamed(context, '/set');
  }

  void createNewPillButton() {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter workout title'),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text('OK'),
              onPressed: () {
                final String buttonText = textController.text;
                if (buttonText.isNotEmpty) {
                  addButton(buttonText);
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GymAppBar(
          subTitle: 'WORKOUT',
          titleAlignment: Alignment.centerRight,
          showBackButton: true,
          showOkButton: true,
          onBackButtonPressed: () => Navigator.pushNamed(context, '/split'),
          onOkButtonPressed: () => Navigator.pushNamed(context, '/choose')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              PillButtonWidget(
                onPressed: createNewPillButton,
                text: 'Create new workout',
                icon: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              Column(
                children: pillButtonsWorkout.asMap().entries.map((entry) {
                  final index = entry.key;
                  final buttonData = entry.value;
                  return Dismissible(
                    key: ValueKey(index),
                    direction: DismissDirection.startToEnd,
                    onDismissed: (direction) {
                      removeButton(buttonData.id);
                    },
                    background: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 16.0),
                      color: Colors.red,
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                    child: PillButtonWidget(
                      onPressed: updateRoute,
                      text: buttonData.text,
                      //swipeToDelete: true,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PillButtonData {
  final int id;
  final String text;

  PillButtonData(this.id, this.text);
}

abstract class WorkoutController extends StateNotifier<Workout> {
  WorkoutController(Workout state) : super(state);
}
