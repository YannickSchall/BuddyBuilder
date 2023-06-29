import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/splits/weekly/weekly_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/exercise.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';
import 'package:buddybuilder/components/circle.dart';

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
        subTitle: 'Weekly Spit',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: true,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleWidget(
                    onPressed: () {
                      // Handle button press
                      print('Button pressed');
                    },
                    text: '1',
                    width: 60,
                    height: 60,
                  ),
                  Text(
                    'week',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.one_k_plus_outlined),
                    onPressed: () {},
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  IconButton(
                    icon: const Icon(Icons.two_k_rounded),
                    onPressed: () {},
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
              WeeklyDatePicker(
                selectedDay: _selectedDay,
                changeDay: (value) => setState(() {
                  _selectedDay = value;
                }),
              ),
              // Add any other widgets you want to display
            ],
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
