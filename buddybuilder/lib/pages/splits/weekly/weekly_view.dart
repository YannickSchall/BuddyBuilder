import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/weekselector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/splits/weekly/weekly_model.dart';
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

    return Scaffold(
      appBar: GymAppBar(
        subTitle: 'Weekly Split',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: true,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
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
                const WeekSelector(),
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
                    y = query;
                  },
                ),
                /*
                SearchWidget(
                  value: model.query,
                  onPressed: () {
                    controller.findMatch(model.query);
                  },
                ),*/
                Column(
                  children: [
                    if (controller.findMatch('x'))
                      PillButtonWidget(
                          buttonHeight: 40,
                          buttonWidth: 100,
                          text: 'PULL',
                          onPressed: () {}),
                  ],
                ),
                // Rest of the widgets
              ],
            ),
          ),
        ),
      ),
    );
  }

  setState(Null Function() param0) {}
}

abstract class WeeklyController extends StateNotifier<WeeklyModel> {
  WeeklyController(WeeklyModel state) : super(state);
  bool findMatch(String input);
}
