import 'package:buddybuilder/pages/weekly/weekly_model.dart';
import 'package:buddybuilder/pages/weekly/weekly_view.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:buddybuilder/services/db/collections/split.dart';

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
  void addSplit(DateTime day, int splitId) {
    //state = state.copyWith(dateSplitMap: state.dateSpliMap[day] = splitId);
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
