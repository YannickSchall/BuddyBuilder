//import 'package:buddybuilder/db/book_model.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';
import 'package:buddybuilder/services/db/isar_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/containerbutton.dart';
import 'package:buddybuilder/material_theme/customicon.dart';
import 'package:buddybuilder/components/datewidget.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/main.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

    final isar = IsarDatabase.instance.isar;

    return Scaffold(
      appBar: GymAppBar(
        title: 'BUDDY\nBUILDER',
        titleAlignment: Alignment.centerRight,
        showBackButton: false,
        showOkButton: false,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PillButtonWidget(
              onPressed: () => Navigator.pushNamed(context, '/calendar'),
              text: 'CALENDAR',
              dateWidget: const DayMonthWidget(),
              buttonHeight: 120.0,
            ),
            ContainerButtonWidget(
              onPressed: () => Navigator.pushNamed(context, '/training'),
              text:
                  'PULL', // TODO: add method to switch training according to day
              containerIcon: Icon(Icons.more_horiz,
                  color: Theme.of(context).colorScheme.primary),
            ),
            PillButtonWidget(
                onPressed: () => Navigator.pushNamed(context, '/plan'),
                text: 'BUILD PLAN',
                icon: Icon(CustomIcons.gymplan,
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
            /*
            PillButtonWidget(
                onPressed: () {},
                text: 'SETTINGS',
                icon: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
            */
            CupertinoSwitch(
              value: model.isDarkModeEnabled,
              activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
              onChanged: (value) {
                // Update the state when the switch is toggled
                controller.switchTheme(value);
              },
            ),
            FutureBuilder<List<ListExercise>>(
              future: controller.getListExercises(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final exercises = snapshot.data ?? [];

                  if (exercises.isNotEmpty) {
                    final exercise = exercises[0];
                    return Text(exercise.name ?? "No name");
                  } else {
                    return const Text('No exercise found');
                  }
                }
              },
            ),
            FutureBuilder<String>(
              future: controller.provideAPIresponse("ball"),
              builder: (context, snapshot) {
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final response = snapshot.data ?? "";
                  if (response != "") {
                    return Text(response);
                  } else {
                    return const Text('No data found');
                  }
                }
              },
            ),
            StreamBuilder<int>(
              stream: controller.getNewestID(),
              initialData: 0, // Provide an initial value for newest
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final int newest = snapshot.data ?? 0;

                  return FloatingActionButton(
                    onPressed: () {
                      print(newest);
                      final exercise = ListExercise()
                        ..id = newest + 1
                        ..name = "Gravity's Rainbow";
                      controller.addListExercise(exercise);
                    },
                    child: const Icon(Icons.add),
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  );
                }
              },
            ),
            FloatingActionButton(
              onPressed: () {
                controller.clearExercises();
              },
              child: const Icon(Icons.delete),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            )
          ],
        ),
      ),
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);

  void switchTheme(bool switchTheme);
  Future<List<ListExercise>> getListExercises();
  void addListExercise(ListExercise exercise);
  void clearExercises();
  Stream<int> getNewestID();
  Future<String> provideAPIresponse(String param);
}
