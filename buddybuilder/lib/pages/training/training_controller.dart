import 'package:buddybuilder/pages/training/training_model.dart';
import 'package:buddybuilder/pages/training/training_view.dart';

class TrainingControllerImplementation extends TrainingController {
  TrainingControllerImplementation({
    TrainingModel? model,
  }) : super(model ?? const TrainingModel());
}
