import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/create_plan/create_plan_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import '../../main.dart';
import 'package:flutter/cupertino.dart';

class PlanView extends StatefulWidget {
  const PlanView({Key? key}) : super(key: key);

  @override
  _PlanViewState createState() => _PlanViewState();
}

void createNewPillButton(List<String> pillButtons, Function(String) addButton) {
  TextEditingController textController = TextEditingController();

  showDialog(
    context: navigatorKey.currentContext!,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Enter Button Text'),
        content: TextField(
          controller: textController,
        ),
        actions: <Widget>[
          ElevatedButton(
            child: Text('Ok'),
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

class _PlanViewState extends State<PlanView> {
  List<String> pillButtons = [];

  void addButton(String buttonText) {
    setState(() {
      pillButtons.add(buttonText);
    });
  }

  void createNewPillButton() {
    TextEditingController textController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Button Text'),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            ElevatedButton(
              child: Text('OK'),
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
        showOkButton: false,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PillButtonWidget(
                onPressed: createNewPillButton,
                text: 'CUSTOM',
                icon: Icon(Icons.add),
              ),
              SizedBox(height: 20),
              Column(
                children: pillButtons.map((buttonText) {
                  return PillButtonWidget(
                      onPressed: createNewPillButton, text: buttonText);
                }).toList(),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}

// Rest of your code...

abstract class PlanController extends StateNotifier<PlanModel> {
  PlanController(PlanModel state) : super(state);
}
