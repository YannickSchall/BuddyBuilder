import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/weekselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/weekly/weekly_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/circle.dart';
import 'package:buddybuilder/components/weekdayselector.dart';
import 'package:buddybuilder/components/weekselector.dart';
import 'package:buddybuilder/components/searchbar.dart';
import 'package:buddybuilder/components/searchbox.dart';
import 'package:buddybuilder/components/pillbutton.dart';

class WeeklyView extends ConsumerWidget {
  const WeeklyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WeeklyController controller =
        ref.read(providers.weeklyControllerProvider.notifier);
    final WeeklyModel model = ref.watch(providers.weeklyControllerProvider);
    DateTime _selectedDay = DateTime.now();
    DateTime _2ndselectedDay = DateTime.now();
    var x;
    var y;
    List<String> list = ["pull", "push", "legs"];

    void showSuccessDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Successfully Added'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: GymAppBar(
        subTitle: 'Weekly Split',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: true,
        onBackButtonPressed: () => Navigator.pushNamed(context, '/workout'),
        onOkButtonPressed: () => Navigator.pushNamed(context, '/home'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'week',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                ),
                //const WeekSelector(),

                WeekSelector(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'days',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
                const WeekDaySelector(),

                MySearchBar(
                  onChanged: (query) {
                    ref
                        .read(providers.weeklyControllerProvider.notifier)
                        .updateQuery(
                            query); // Update the query in the controller
                  },
                ),
                if (list.contains(model
                    .query)) // Condition to check if model.query is in the list
                  PillButtonWidget(
                    buttonHeight: 40,
                    buttonWidth: 100,
                    text: model.query,
                    onPressed: showSuccessDialog,
                  ),
                // Rest of the widgets
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class WeeklyController extends StateNotifier<WeeklyModel> {
  WeeklyController(WeeklyModel state) : super(state);
  bool findMatch(String input);
  String getInput();
  void updateQuery(String query);
  void updateWeekSelector();
}
