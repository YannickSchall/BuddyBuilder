import 'package:buddybuilder/pages/create_plan/02_edit_split/edit_split_model.dart';
import 'package:buddybuilder/pages/create_plan/02_edit_split/edit_split_view.dart';
import 'package:buddybuilder/services/api/api_service.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';

class EditSplitControllerImplementation extends EditSplitController {
  EditSplitControllerImplementation({
    required this.db,
    required this.api,
    EditSplitModel? model,
  }) : super(model ?? EditSplitModel(workoutList: [], workoutTitle: '', widgetList: [], setId: 0));

  DBService db;
  APIService api;
  final Map<int, String> workoutTitles = {};

  @override
  Future<List<ListExercise>> getListExerciseList() async {
    final allExercises = await db.getExercises();
    final searchQuery = state.searchQuery;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final lowerCaseQuery = searchQuery.toLowerCase();
      final filteredExercises = allExercises.where((exercise) {
        final lowerCaseName = exercise.name?.toLowerCase() ?? '';
        return lowerCaseName.contains(lowerCaseQuery);
      }).toList();
      return filteredExercises;
    } else {
      return allExercises;
    }
  }

  @override
  void createListExercise(int id, String name) async {
    final listExercise = ListExercise()
      ..id = id
      ..name = name;
    db.addExercise(listExercise);
  }

  @override
  void addWorkout(int id, String name, int splitId) async{
    int exerciseId = await db.tryNewest(Exercise, splitId) + 1;
    state = state.copyWith(workoutTitle: name, workoutList: [...state.workoutList, id]);
    workoutTitles[id] = name;

    ExSet dummy = ExSet()
    ..id=0
    ..kg=0.0
    ..reps=0;
    List<ExSet> sets = [dummy];

    final exercise = Exercise()
    ..name = name
    ..id = exerciseId
    ..sets = sets;
    db.addExerciseToSplit(splitId, exercise);

    // Trigger rebuild
  }


  @override
  void removeWorkout(int id, int splitId) {
    state = state.copyWith(
      workoutList: [...state.workoutList]..remove(id),
    );
  db.removeExerciseToSplit(splitId, id);
    // Trigger rebuild
  
  }

  @override
  void removeAllSets() {
    state.widgetList.clear();
    state = state.copyWith(); // Trigger rebuild
  }

  @override
  void fetchToDB() async {
    api.fillDatabase();
  }

  @override
  Future<int> getNewestExerciseID() async {
    return await db.tryNewest(ListExercise);
  }

  @override
  String getWorkoutTitle(int id) {
    return workoutTitles[id] ?? '';
  }

  @override
  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  @override
  Future<List<Exercise>> getAllExercisesList(int splitId) async {
    return await db.getExercisesListFromSplit(splitId);
  }

  @override
  Future<List<ExSet>> getAllSetsFromExercise(int splitId, int exerciseId) async {
    return await db.getSetsFromExercise(splitId, exerciseId);
  }
}
