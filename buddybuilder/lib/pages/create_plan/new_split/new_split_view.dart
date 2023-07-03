import 'package:buddybuilder/services/db/exercise.dart';
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

    final exercisesProvider = FutureProvider<List<Exercise>>((ref) async {
      return controller.getExerciseList();
    });

    final asyncValue = ref.watch(exercisesProvider);

    void showSuccessDialog(BuildContext context, WidgetRef ref) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer(
            builder: (context, ref, _) {
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
                      FutureBuilder<int>(
                        future: controller.getNewest(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else {
                            int txt = snapshot.data ?? 99;

                            return Text(txt.toString());
                          }
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PillButtonWidget(
                            onPressed: () {
                              controller.fetchToDB();
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
                        child: Consumer(
                          builder: (context, ref, _) {
                            final asyncValue = ref.watch(exercisesProvider);

                            return asyncValue.when(
                              data: (exercises) {
                                if (exercises != null && exercises.isNotEmpty) {
                                  return ListView.builder(
                                    itemCount: exercises.length,
                                    itemBuilder: (context, index) {
                                      final exercise = exercises[index];
                                      return ExerciseWidget(
                                        name: exercise.name ?? 'No name',
                                        onPressed: (id) {
                                          // Handle workout selection
                                          controller.addWorkout(
                                              id, exercise.name ?? "No name");
                                          // Close the dialog
                                        },
                                        id: index,
                                      );
                                    },
                                  );
                                } else {
                                  return ListTile(
                                    title: Text('No exercises available'),
                                  );
                                }
                              },
                              loading: () => const CircularProgressIndicator(),
                              error: (error, stackTrace) =>
                                  Text('Error: $error'),
                            );
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

    final setWidgetProvider = Provider.family<SetWidget, int>((ref, id) {
      return SetWidget(
        setTitle: model.workoutTitle,
        kgValue: '1',
        repsValue: '1',
        onPressed: ref
            .read(providers.newsplitControllerProvider.notifier)
            .removeWorkout,
      );
    });

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

  void addWorkout(int id, String name);

  void removeWorkout(int id);

  void removeAllSets();

  Future<List<Exercise>> getExerciseList();

  void fetchToDB();

  Future<int> getNewest();
}
