import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:buddybuilder/services/api/api_service.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';

import '../../services/db/collections/split.dart';

class HomeControllerImplementation extends HomeController {
  late Stream<int> newestIdStream;

  HomeControllerImplementation({
    required this.db,
    HomeModel? model,
  }) : super(model ?? HomeModel(isDarkModeEnabled: false));
  DBService db;

  @override
  Future<Split> getTodaysSplitID() async {
    Split? split = await db.getSplitToDayByWeekday();

    return split!;
  }
}
