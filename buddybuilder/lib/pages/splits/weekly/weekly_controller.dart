import 'package:buddybuilder/pages/splits/weekly/weekly_model.dart';
import 'package:buddybuilder/pages/splits/weekly/weekly_view.dart';

class WeeklyControllerImplementation extends WeeklyController {
  WeeklyControllerImplementation({
    WeeklyModel? model,
  }) : super(model ?? const WeeklyModel(splits: ["split"]));

  @override
  bool findMatch(String input) {
    // Perform search logic to find a match based on input and the text of pill buttons

    // Perform search logic to find a match based on input and the text of pill buttons
    final match = state.splits
        .firstWhere((element) => element == input, orElse: () => null);
    print(input);
    return match != null;
  }
}
