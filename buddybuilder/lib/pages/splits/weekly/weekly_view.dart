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

class WeeklyView extends ConsumerWidget {
  const WeeklyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WeeklyController controller =
        ref.read(providers.weeklyControllerProvider.notifier);
    final WeeklyModel model = ref.watch(providers.weeklyControllerProvider);
    DateTime _selectedDay =
        DateTime.now(); // Add this line to declare _selectedDay
    DateTime _2ndselectedDay = DateTime.now();

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
          padding: const EdgeInsets.only(left: 16.0), // Add left padding
          child: Center(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to left
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'week',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ),
                WeekSelector(),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'days',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                WeekDaySelector(),
                // Add any other widgets you want to display
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
}
