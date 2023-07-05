import 'package:buddybuilder/pages/weekly/weekly_model.dart';
import 'package:buddybuilder/pages/weekly/weekly_view.dart';

class WeeklyControllerImplementation extends WeeklyController {
  WeeklyControllerImplementation({
    WeeklyModel? model,
  }) : super(model ??
            const WeeklyModel(
                splits: ["pull"],
                query: "",
                weekselector: false,
                selectedDay: ""));

  @override
  bool findMatch(String input) {
    // Perform search logic to find a match based on input and the text of pill buttons
    bool isMatchFound;
    //state = state.copyWith(query: input);
    //state = state.copyWith(query: input);
    return state.splits.contains(input);
  }

  @override
  void updateQuery(String query) {
    state = state.copyWith(query: query);
  }

  @override
  void updateWeekSelector() {
    state = state.copyWith(weekselector: !state.weekselector);
  }

  @override
  String getInput() {
    return state.query;
  }
}
