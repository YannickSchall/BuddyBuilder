import 'package:buddybuilder/pages/create_plan/new_split/new_split_model.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_view.dart';

class NewSplitControllerImplementation extends NewSplitController {
  NewSplitControllerImplementation({
    NewSplitModel? model,
  }) : super(model ??
            const NewSplitModel(workoutList: [
              'beinpresse',
              'armpresse',
              'beinpresse',
              'armpresse',
              'beinpresse',
              'armpresse',
              'beinpresse',
              'armpresse',
            ], workoutTitle: ''));

  void addWorkout(String name) {
    print('clicked');
    Future.delayed(Duration(seconds: 10), () {
      state = state.copyWith(workoutList: [...state.workoutList, name]);
    });
  }
}
