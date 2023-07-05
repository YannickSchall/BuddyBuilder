import 'package:buddybuilder/pages/weekly/weekly_model.dart';
import 'package:buddybuilder/pages/weekly/weekly_view.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:buddybuilder/services/db/collections/split_to_day.dart';

class WeeklyControllerImplementation extends WeeklyController {
  WeeklyControllerImplementation({
    required this.db,
    WeeklyModel? model,
  }) : super(model ??
            WeeklyModel(
                splitList: [],
                splitTitle: "",
                searchQuery: "",
                weekselector: false,
                selectedDay: "",
                dateSplitMap: {}));

  DBService db;

  final Map<int, String> splitTitles = {};
  final Map<String, int> xs = {};

  @override
  Future<List<Split>> getSplitList() async {
    final allSplits = await db.getAllSplits();
    final searchQuery = state.searchQuery;

    if (searchQuery != null && searchQuery.isNotEmpty) {
      final lowerCaseQuery = searchQuery.toLowerCase();
      final filteredSplits = allSplits.where((split) {
        final lowerCaseName = split.name?.toLowerCase() ?? '';
        return lowerCaseName.contains(lowerCaseQuery);
      }).toList();
      return filteredSplits;
    } else {
      return allSplits;
    }
  }

  @override
  void updateSearchQuery(String query) {
    state = state.copyWith(searchQuery: query);
  }

  @override
  Future<int> getNewestSplitToDayID() async {
    return await db.tryNewest(SplitToDay);
  }

  @override
  void addSplit(String weekday, int id, String splitname) async {
    int newestid = await getNewestSplitToDayID() + 1;

    final splitToDay = SplitToDay()
      ..id = newestid
      ..splitID = id
      ..weekday = weekday
      ..name = splitname;

    db.addSplitToDay(splitToDay);

    final updatedDateSplitMap = {...state.dateSplitMap, weekday: id};

    state = state.copyWith(dateSplitMap: updatedDateSplitMap);
  }

  @override
  String getSplitTitle(int id) {
    return splitTitles[id] ?? '';
  }

  @override
  void updateWeekSelector() {
    state = state.copyWith(weekselector: !state.weekselector);
  }
}
