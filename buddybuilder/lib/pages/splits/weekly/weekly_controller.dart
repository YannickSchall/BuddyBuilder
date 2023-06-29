import 'package:buddybuilder/pages/splits/weekly/weekly_model.dart';
import 'package:buddybuilder/pages/splits/weekly/weekly_view.dart';

class WeeklyControllerImplementation extends WeeklyController {
  WeeklyControllerImplementation({
    WeeklyModel? model,
  }) : super(model ?? const WeeklyModel());
}
