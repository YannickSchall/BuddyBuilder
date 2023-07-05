import 'package:buddybuilder/services/db/collections/list_exercise.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/create_plan/02_edit_split/edit_split_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/exercise_list.dart';
import 'package:buddybuilder/components/searchbar.dart';
import 'package:buddybuilder/components/setwidget.dart';
import 'package:buddybuilder/components/draggable.dart';
import 'package:buddybuilder/services/db/collections/split.dart';

class EditSplitView extends ConsumerWidget {
  final int splitId;

  const EditSplitView({
    Key? key, required this.splitId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EditSplitController controller = ref.read(providers.editSplitControllerProvider.notifier);
    final EditSplitModel model = ref.watch(providers.editSplitControllerProvider);

    final exercisesProvider = FutureProvider<List<ListExercise>>((ref) async {
      return controller.getListExerciseList();
    });

    final futureexerciseProvider = FutureProvider<List<Exercise>>((ref) async {
      return controller.getAllExercisesList(splitId);
    });

    

    void showSuccessDialog(BuildContext context, WidgetRef ref) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Consumer(
            builder: (context, ref, _) {
              void reloadExercises() {
                ref.refresh(exercisesProvider);
              }

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
                          ref.read(providers.editSplitControllerProvider.notifier).updateSearchQuery(query);
                          reloadExercises();
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                                          controller.addWorkout(id, exercise.name ?? "No name", splitId);
                                          // Close the dialog
                                        },
                                        id: index,
                                      );
                                    },
                                  );
                                } else {
                                  return const ListTile(
                                    title: Text('No exercises available'),
                                  );
                                }
                              },
                              loading: () => const CircularProgressIndicator(),
                              error: (error, stackTrace) => Text('Error: $error'),
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

    return Scaffold(
  appBar: GymAppBar(
    subTitle: 'EDIT SPLIT',
    titleAlignment: Alignment.centerRight,
    showBackButton: true,
    showOkButton: true,
    onBackButtonPressed: () => Navigator.pushNamed(context, '/plan'),
    onOkButtonPressed: () => Navigator.pushNamed(context, '/home'),
  ),
  body: SingleChildScrollView(
    child: Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PillButtonWidget(
              onPressed: () {
                showSuccessDialog(context, ref);
              },
              text: 'Add Workout',
            ),
            Consumer(
              builder: (context, ref, _) {
                final asyncValue = ref.watch(futureexerciseProvider);
                return asyncValue.when(
                  data: (exercises) {
                    if (exercises != null && exercises.isNotEmpty) {
                      return Column(
                        children: exercises.map((exercise) {
                          return SetWidget(
                            setTitle: exercise.name ?? 'No name',
                            kgValue: '0', // Provide the kgValue argument here
                            repsValue: '', // Provide the repsValue argument here
                            onPressed: (id) {
                              // Handle workout selection
                              controller.removeWorkout(id, splitId);
                              // Close the dialog
                            },
                            customId: exercise.id ?? 0,
                          );
                        }).toList(),
                      );
                    } else {
                      return const ListTile(
                        title: Text('No exercises available'),
                      );
                    }
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) => Text('Error: $error'),
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

abstract class EditSplitController extends StateNotifier<EditSplitModel> {
  EditSplitController(EditSplitModel state) : super(state);

  void addWorkout(int id, String name, int splitId);

  void removeWorkout(int id, int splitId);

  void removeAllSets();

  Future<List<ListExercise>> getListExerciseList();

  void fetchToDB();

  Future<int> getNewestExerciseID();

  String getWorkoutTitle(int id);

  void updateSearchQuery(String query);

  Future<List<Exercise>> getAllExercisesList(int splitId);
}
