import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/exercise_list.dart';
import 'package:buddybuilder/components/searchbar.dart';
import 'package:buddybuilder/components/setwidget.dart';
import 'package:buddybuilder/components/draggable.dart';

final setWidgetProvider = Provider.family<SetWidget, int>((ref, id) {
  return SetWidget(
    setTitle: 'Set $id',
    kgValue: '1',
    repsValue: '1',
    onPressed:
        ref.read(providers.newsplitControllerProvider.notifier).removeWorkout,
  );
});

class NewSplitView extends ConsumerWidget {
  NewSplitView({
    Key? key,
  }) : super(key: key);

  List<SetWidget> currentExercises = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NewSplitController controller =
        ref.read(providers.newsplitControllerProvider.notifier);
    final NewSplitModel model = ref.watch(providers.newsplitControllerProvider);

    void showSuccessDialog(BuildContext context, WidgetRef ref) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer(
            builder: (context, ref, _) {
              final availableWorkouts = [
                'Workout 1',
                'Workout 2',
                'Workout 3',
                'Workout 4',
              ]; // Replace with your actual list of available workouts

              return Dialog(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      MySearchBar(
                        onChanged: (query) {
                          ref
                              .read(providers.weeklyControllerProvider.notifier)
                              .updateQuery(query);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PillButtonWidget(
                            onPressed: () {
                              // Handle button 1 press
                            },
                            text: 'x',
                            buttonHeight: 20.0,
                            buttonWidth: 100.0,
                          ),
                          const Spacer(),
                          PillButtonWidget(
                            onPressed: () {
                              // Handle button 2 press
                            },
                            text: 'create',
                            buttonHeight: 20.0,
                            buttonWidth: 100.0,
                          ),
                        ],
                      ),
                      Expanded(
                        child: FutureBuilder<void>(
                          future: Future<void>.microtask(() {}),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return ListView(
                                shrinkWrap: true,
                                children: [
                                  for (int i = 0;
                                      i < availableWorkouts.length;
                                      i++)
                                    ExerciseWidget(
                                      name: availableWorkouts[i],
                                      onPressed: (id) {
                                        // Handle workout selection
                                        controller.addWorkout(id);
                                        Navigator.pop(
                                            context); // Close the dialog
                                      },
                                      id: i,
                                    ),
                                ],
                              );
                            } else {
                              return const CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: GymAppBar(
        subTitle: 'New Split',
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
              crossAxisAlignment: CrossAxisAlignment.center,
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
                PillButtonWidget(
                  onPressed: () {
                    showSuccessDialog(context, ref);
                  },
                  text: 'Add Workout',
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final setWidgets = ref
                        .read(providers.newsplitControllerProvider)
                        .workoutList
                        .map((id) => ref.watch(setWidgetProvider(id)))
                        .toList();

                    return Column(
                      children: setWidgets,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class NewSplitController extends StateNotifier<NewSplitModel> {
  NewSplitController(NewSplitModel state) : super(state);

  void addWorkout(int id);

  void removeWorkout(int id);

  void removeAllSets();
}
