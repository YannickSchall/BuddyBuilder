import 'package:buddybuilder/pages/training/training_model.dart';
import 'package:buddybuilder/pages/training/training_view.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:buddybuilder/services/db/collections/split_to_day.dart';

class TrainingControllerImplementation extends TrainingController {
  TrainingControllerImplementation({
    required this.db,
    TrainingModel? model,
  }) : super(model ??
            const TrainingModel(
                workoutList: [], workoutTitle: '', widgetList: [], setId: 0));

  DBService db;

  final Map<int, String> workoutTitles = {};

  /*
  getTraining()
  get Trainings of a Split
  */
  @override
  Future<Split> getTraining(int splitId) async {
    return await db.getSplitNoNull(splitId);
  }

  /*
  todaysSplit()
  get Todays split matched by todays day
  */
  @override
  Future<Split?> todaysSplit() async {
    return await db.getSplitToDayByWeekday();
  }

  @override
  DBService getDB() {
    return db;
  }

  /*
  addWorkout()
  add workout to db 
  */
  @override
  void addWorkout(int id, String name, int splitId) async {
    int exerciseId = await db.tryNewest(Exercise, splitId) + 1;
    state = state
        .copyWith(workoutTitle: name, workoutList: [...state.workoutList, id]);
    workoutTitles[id] = name;

    final exercise = Exercise()
      ..name = name
      ..id = exerciseId;
    db.addExerciseToSplit(splitId, exercise);
  }

  /*
  addSet()
  add set to db 
  */
  @override
  void addSet(int id, int splitId, int excerciseId) async {
    int setId = await db.tryNewest(ExSet, splitId, excerciseId) + 1;
    state = state.copyWith(setId: setId, widgetList: [...state.widgetList, id]);

    final exset = ExSet()..id = setId;
    db.addSetToExercise(splitId, excerciseId, exset);
    // Trigger rebuild
  }

  /*
  removeWorkout()
  remove workout from db 
  */
  @override
  void removeWorkout(int id, int splitId) {
    state = state.copyWith(
      workoutList: [...state.workoutList]..remove(id),
    );
    db.removeExerciseToSplit(splitId, id);
    // Trigger rebuild
  }

  /*
  removeAllSets()
  remove all sets from db 
  */
  @override
  void removeAllSets() {
    state.widgetList.clear();
    state = state.copyWith(); // Trigger rebuild
  }

  /*
  getWorkoutTitle()
  getWorkoutTitle from list
  */
  @override
  String getWorkoutTitle(int id) {
    return workoutTitles[id] ?? '';
  }
}
