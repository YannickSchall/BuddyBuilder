import 'package:buddybuilder/components/containerbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import '../../../main.dart';

/*
class PlanView extends StatefulWidget {
  const PlanView({Key? key}) : super(key: key);

  @override
  _PlanViewState createState() => _PlanViewState();
}

class _PlanViewState extends State<PlanView> {
  List<PillButtonData> pillButtons = [];
  int nextButtonId = 0;

  @override
  void initState() {
    super.initState();
    _loadButtonData();
  }

  void _loadButtonData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? buttonDataList = prefs.getStringList('buttonData');

    if (buttonDataList != null) {
      setState(() {
        pillButtons = buttonDataList.map((data) {
          final parts = data.split(':');
          final buttonId = int.parse(parts[0]);
          final buttonText = parts[1];
          return PillButtonData(buttonId, buttonText);
        }).toList();
      });
    }
  }

  void addButton(String buttonText) {
    setState(() {
      final buttonData = PillButtonData(nextButtonId, buttonText);
      pillButtons.add(buttonData);
      nextButtonId++;
    });
    _saveButtonData();
  }

  void removeButton(int buttonId) {
    setState(() {
      pillButtons.removeWhere((button) => button.id == buttonId);
    });
    _saveButtonData();
  }

  void _saveButtonData() async {
    final List<String> buttonDataList = pillButtons.map((data) {
      return '${data.id}:${data.text}';
    }).toList();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('buttonData', buttonDataList);
  }

  void updateRoute() {
    Navigator.pushNamed(context, '/split');
  }

  void createNewPillButton() {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter plan title'),
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
        subTitle: 'PLANS',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: true,
        onBackButtonPressed: () => Navigator.pushNamed(context, '/home'),
        onOkButtonPressed: () => Navigator.pushNamed(context, '/home'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ContainerButtonWidget(
                onPressed: createNewPillButton,
                text: 'Create new plan',
                icon: const Icon(Icons.add),
                containerIcon: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              Column(
                children: pillButtons.asMap().entries.map((entry) {
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

abstract class PlanController extends StateNotifier<TrainingPlan> {
  PlanController(TrainingPlan state) : super(state);
}
*/