import 'package:buddybuilder/pages/create_plan/02_split/split_model.dart';
import 'package:buddybuilder/pages/create_plan/02_split/split_view.dart';

class SplitControllerImplementation extends SplitController {
  SplitControllerImplementation({TrainingSplit? model})
      : super(model ?? const TrainingSplit(
        name: "Split",
        workouts: [],
      ));
}