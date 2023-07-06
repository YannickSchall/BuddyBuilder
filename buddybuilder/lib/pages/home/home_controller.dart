import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:buddybuilder/services/api/api_service.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';

import '../../services/db/collections/split.dart';

class HomeControllerImplementation extends HomeController {
  late Stream<int> newestIdStream;
  DBService db;
  APIService api;

  HomeControllerImplementation({
    required this.db,
    required this.api,
    HomeModel? model,
  }) : super(model ?? HomeModel(isDarkModeEnabled: false));

  @override
  Future<List<ListExercise>> getListExercises() {
    return db.getExercises();
  }

  @override
  void addListExercise(ListExercise exercise) {
    db.addExercise(exercise);
  }

  @override
  Stream<int> getNewestID() {
    return db.getNewestID();
  }

  @override
  void clearExercises() {
    db.clearExercises();
  }

//----------------------------------------------

  @override
  Future<String> provideAPIresponse(String param) async {
    return api.provideAPIresponse(param);
  }

  @override
  Future<Split> getTodaysSplitID() async {
    Split? split = await db.getSplitToDayByWeekday();

    return split!;
  }
}
