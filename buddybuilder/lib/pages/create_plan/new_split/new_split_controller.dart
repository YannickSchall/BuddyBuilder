import 'package:buddybuilder/pages/create_plan/new_split/new_split_model.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_view.dart';
import 'package:buddybuilder/services/api/api_service.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';

class NewSplitControllerImplementation extends NewSplitController {
  NewSplitControllerImplementation({
    required this.db,
    required this.api,
    NewSplitModel? model,
  }) : super(model ?? NewSplitModel(workoutList: [], workoutTitle: '', widgetList: [], setId: 0));

  DBService db;
  APIService api;
  final Map<int, String> workoutTitles = {};
/*
  @override
  void addWorkout(String name) {
    print('clicked');
    Future.delayed(Duration(seconds: 10), () {
      state = state.copyWith(workoutList: [...state.workoutList, name]);
    });
  }

  @override
  void removeAllSets() {
    Future.delayed(Duration(seconds: 10), () {
      state = state.copyWith(workoutList: []);
    });
  }

  @override
  void removeWorkout(int id) {
    Future.delayed(Duration(seconds: 10), () {
      state = state.copyWith(
        widgetList: [
          ...state.widgetList
        ] // Create a new list using spread operator
          ..removeWhere((item) => item.setid == id),
      );
    });
    
  }*/

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
  void addWorkout(int id, String name) {
    state = state.copyWith(workoutTitle: name, workoutList: [...state.workoutList, id]);
    workoutTitles[id] = name;
    // Trigger rebuild
  }

  @override
  void removeWorkout(int id) {
    state = state.copyWith(
      workoutList: [...state.workoutList]..remove(id),
    );
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
}
