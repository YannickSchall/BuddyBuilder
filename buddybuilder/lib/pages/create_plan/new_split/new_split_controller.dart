import 'package:buddybuilder/pages/create_plan/new_split/new_split_model.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_view.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:buddybuilder/services/db/exercise.dart';

class NewSplitControllerImplementation extends NewSplitController {
  NewSplitControllerImplementation({
    required this.db,
    NewSplitModel? model,
  }) : super(model ??
            NewSplitModel(
                workoutList: [], workoutTitle: '', widgetList: [], setId: 0));

  DBService db;
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
  Future<List<Exercise>> getExerciseList() async {
    final reponse = db.getExercises();
    return reponse;
  }

  @override
  void addWorkout(int id, String name) {
    state = state
        .copyWith(workoutTitle: name, workoutList: [...state.workoutList, id]);

    // Trigger rebuild
  }

  @override
  void removeWorkout(int id) {
    state = state.copyWith(workoutList: [...state.workoutList]..remove(id));
  }

  @override
  void removeAllSets() {
    state.widgetList.clear();
    state = state.copyWith(); // Trigger rebuild
  }
}
