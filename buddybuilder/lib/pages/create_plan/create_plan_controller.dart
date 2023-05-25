import 'package:buddybuilder/pages/create_plan/create_plan_model.dart';
import 'package:buddybuilder/pages/create_plan/create_plan_view.dart';

class PlanControllerImplementation extends PlanController {
  PlanControllerImplementation({
    PlanModel? model,
  }) : super(model ?? const PlanModel());
}
