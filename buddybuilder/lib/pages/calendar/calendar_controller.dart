import 'dart:math';

import 'package:buddybuilder/pages/calendar/calendar_model.dart';
import 'package:buddybuilder/pages/calendar/calendar_view.dart';
import 'package:buddybuilder/services/db/db_service.dart';

class CalendarControllerImplementation extends CalendarController {
  CalendarControllerImplementation({
    required this.db,
    CalendarModel? model,
  }) : super(model ?? const CalendarModel());

  DBService db;

  /*
  updateSelectedDate() updates the selected date watched by the provider
  */
  @override
  void updateSelectedDate(DateTime selectedDate) {
    state = state.copyWith(selectedDate: selectedDate);
  }

  /*
  getOverkill() provides the stored sets
   - this function is called overkill because of its type :)
  */
  @override
  Future<List<Map<String, List<Map<String, String>>>>> getOverkill() async {
    List<Map<String, String>> emptyList = [];
    final parsedExercises = await db.setToMap();
    return parsedExercises;
  }
}
