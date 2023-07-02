import 'package:buddybuilder/pages/rotation/rotation_model.dart';
import 'package:buddybuilder/pages/rotation/rotation_view.dart';

class RotationControllerImplementation extends RotationController {
  RotationControllerImplementation({
    RotationModel? model,
  }) : super(model ?? const RotationModel());
}
