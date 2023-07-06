import 'package:buddybuilder/services/db/db_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/training/training_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/exercise_list.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:buddybuilder/services/db/collections/split_to_day.dart';
import 'package:buddybuilder/components/setwidget.dart';

class TrainingView extends ConsumerWidget {
  final int splitID;
  final String splitName;

  TrainingView({
    required this.splitID,
    required this.splitName,
    Key? key,
  }) : super(key: key);

  void showSuccessDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('You completed your training !',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Theme.of(context).colorScheme.onSecondaryContainer)),
          actions: [
            MaterialButton(
              child: const Text('OK', textAlign: TextAlign.left),
              color: Theme.of(context).colorScheme.primary,
              textColor: Theme.of(context).colorScheme.secondaryContainer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          actionsAlignment: MainAxisAlignment.spaceBetween,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TrainingController controller =
        ref.read(providers.trainingControllerProvider.notifier);
    final TrainingModel model = ref.watch(providers.trainingControllerProvider);

    final trainingsProvider = FutureProvider<Split?>((ref) async {
      return controller.todaysSplit();
    });

    return Scaffold(
      appBar: GymAppBar(
        subTitle: splitName ?? 'REST',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: true,
        onBackButtonPressed: () => Navigator.pushNamed(context, '/home'),
        onOkButtonPressed: () {
          showSuccessDialog(context);
          Navigator.pushNamed(context, '/home');
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Consumer(
                  builder: (context, ref, _) {
                    final asyncValue = ref.watch(trainingsProvider);
                    return asyncValue.when(
                      data: (split) {
                        final exercises = split?.exercises ?? [];
                        if (exercises != null && exercises.isNotEmpty) {
                          return Column(
                            children: exercises.map((exercise) {
                              return FutureBuilder<List<ExSet>>(
                                future: controller.getAllSetsFromExercise(splitID, exercise.id),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState == ConnectionState.waiting) {
                                    return const CircularProgressIndicator();
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    final setsMap = snapshot.data!.fold<Map<int, ExSet>>(
                                      {},
                                      (map, set) => map..[set.id!] = set,
                                      
                                    );
                                    return SetWidget(
                                      setTitle: exercise.name ?? 'No name',
                                      kgValues: {}, // Provide the kgValue argument here
                                      repsValues: {}, // Provide the repsValue argument here
                                      exSets: setsMap, // Use the sets from the snapshot data
                                      onPressed: (id) {
                                        // Handle workout selection
                                        controller.removeWorkout(exercise.id, splitID);
                                        // Close the dialog
                                      },
                                      splitID: splitID,
                                      exerciseID: exercise.id ?? 0,
                                      customId: exercise.id ?? 0,
                                      db: db,
                                    );
                                  }
                                },
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
    );
  }
}

abstract class TrainingController extends StateNotifier<TrainingModel> {
  TrainingController(TrainingModel state) : super(state);

  Future<Split> getTraining(int splitId);
  void addWorkout(int id, String name, int splitId);
  void addSet(int id, int splitId, int excerciseId);
  void removeWorkout(int id, int splitId);
  void removeAllSets();
  String getWorkoutTitle(int id);
  DBService getDB();
  Future<Split?> todaysSplit();
  Future<List<ExSet>> getAllSetsFromExercise(int splitId, int exerciseId);
}
