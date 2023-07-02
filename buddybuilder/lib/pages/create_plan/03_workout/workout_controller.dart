import 'package:buddybuilder/pages/create_plan/03_workout/workout_view.dart';
import 'package:buddybuilder/pages/create_plan/03_workout/workout_model.dart';

class WorkoutControllerImplementation extends WorkoutController {
  WorkoutControllerImplementation({Workout? model})
      : super(model ??
            const Workout(
              name: "Workout",
              sets: [],
            ));
}
