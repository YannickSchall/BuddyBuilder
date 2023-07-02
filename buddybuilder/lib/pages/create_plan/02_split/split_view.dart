import 'package:buddybuilder/pages/create_plan/02_split/split_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import '../../../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplitView extends StatefulWidget {
  const SplitView({Key? key}) : super(key: key);

  @override
  _SplitViewState createState() => _SplitViewState();
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

class _SplitViewState extends State<SplitView> {
  List<PillButtonData> pillButtonsSPLIT = [];
  int nextButtonId = 0;

  @override
  void initState() {
    super.initState();
    _loadButtonData();
  }

  void _loadButtonData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? buttonDataSplitList =
        prefs.getStringList('buttonDataSplit');

    if (buttonDataSplitList != null) {
      setState(() {
        pillButtonsSPLIT = buttonDataSplitList.map((data) {
          final parts = data.split(':');
          final buttonId = int.parse(parts[0]);
          final buttonText = parts[1];
          return PillButtonData(buttonId, buttonText);
        }).toList();
      });
    }
  }

  void _saveButtonData() async {
    final List<String> buttonDataSplitList = pillButtonsSPLIT.map((datasplit) {
      return '${datasplit.id}:${datasplit.text}';
    }).toList();

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('buttonDataSplit', buttonDataSplitList);
  }

  void addButton(String buttonText) {
    setState(() {
      final buttonData = PillButtonData(nextButtonId, buttonText);
      pillButtonsSPLIT.add(buttonData);
      nextButtonId++;
    });
    _saveButtonData();
  }

  void removeButton(int buttonId) {
    setState(() {
      pillButtonsSPLIT.removeWhere((button) => button.id == buttonId);
    });
    _saveButtonData();
  }

  void updateRoute() {
    Navigator.pushNamed(context, '/workout');
  }

  void createNewPillButton() {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter split title'),
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
          subTitle: 'SPLIT',
          titleAlignment: Alignment.centerRight,
          showBackButton: true,
          showOkButton: true,
          onBackButtonPressed: () => Navigator.pushNamed(context, '/plan'),
          onOkButtonPressed: () => Navigator.pushNamed(context, '/workout')),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PillButtonWidget(
                onPressed: createNewPillButton,
                text: 'Create new split',
                icon: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              Column(
                children: pillButtonsSPLIT.asMap().entries.map((entry) {
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

abstract class SplitController extends StateNotifier<TrainingSplit> {
  SplitController(TrainingSplit state) : super(state);
}
