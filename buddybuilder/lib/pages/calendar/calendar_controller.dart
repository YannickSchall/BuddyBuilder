import 'dart:math';

import 'package:buddybuilder/pages/calendar/calendar_model.dart';
import 'package:buddybuilder/pages/calendar/calendar_view.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:buddybuilder/services/db/collections/training.dart';
import 'package:buddybuilder/services/db/db_service.dart';

class CalendarControllerImplementation extends CalendarController {
  CalendarControllerImplementation({
    required this.db,
    CalendarModel? model,
  }) : super(model ?? const CalendarModel());

  DBService db;

  @override
  void updateSelectedDate(DateTime selectedDate) {
    state = state.copyWith(selectedDate: selectedDate);
  }
}
