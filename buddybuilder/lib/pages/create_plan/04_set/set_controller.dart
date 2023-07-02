import 'package:buddybuilder/pages/create_plan/04_set/set_view.dart';
import 'package:buddybuilder/pages/create_plan/04_set/set_model.dart';

class SetControllerImplementation extends SetController {
  SetControllerImplementation({ExerciseSet? model})
      : super(model ?? const ExerciseSet(
        name: "Set",
        reps: 0,
        weight: 0,
      ));
}