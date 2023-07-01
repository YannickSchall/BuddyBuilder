import 'package:buddybuilder/pages/calendar/calendar/calendar_model.dart';
import 'package:buddybuilder/pages/calendar/calendar/calendar_view.dart';

class CalendarControllerImplementation extends CalendarController {
  CalendarControllerImplementation({
    CalendarModel? model,
  }) : super(model ?? const CalendarModel());
}
