import 'package:buddybuilder/pages/create_plan/create_plan_model.dart';
import 'package:buddybuilder/pages/create_plan/create_plan_view.dart';

class PlanControllerImplementation extends PlanController {
  PlanControllerImplementation({PlanModel? model})
      : super(model ?? const PlanModel());
}
/*
class HtwgDetailAutoDisposeFamilyControllerImplementation
    extends HtwgDetailAutoDisposeFamilyController {
  final String
      _id; //Über die Id kann bspw. ein Backend Call durchgeführt werden etc.
  HtwgDetailAutoDisposeFamilyControllerImplementation(
      {required String id, HtwgDetailAutoDisposeFamilyModel? model})
      : _id = id,
        super(
          model ??
              HtwgDetailAutoDisposeFamilyModel(
                semester: id == '1'
                    ? 'SommerSemester 2022'
                    : 'WinterSemester 2022/2023',
                studentsCount: 0,
              ),
        );

  @override
  void addPlan() {
    state = state.copyWith(studentsCount: state.studentsCount + 1);
  }

  @override
  void navigateBack({required BuildContext context}) => Navigator.pop(context);
}

*/