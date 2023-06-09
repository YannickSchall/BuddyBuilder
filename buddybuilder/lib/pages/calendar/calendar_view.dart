import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/pages/calendar/calendar_model.dart';
import 'package:buddybuilder/pages/calendar/calendar_controller.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarController controller =
        ref.read(providers.calendarControllerProvider.notifier);
    final CalendarModel model = ref.watch(providers.calendarControllerProvider);

    var _eventList;
    return Scaffold(
      appBar: GymAppBar(
        //title: 'BUDDY\nBUILDER',
        //excerciseTitle: 'QUADS &Längerrrrweg',
        subTitle: 'Overview',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: false,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
      ),
      body: SafeArea(
        child: Calendar(
          startOnMonday: true,
          weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sar', 'Sun'],
          eventsList: _eventList,
          isExpandable: true,
          eventDoneColor: Color.fromARGB(255, 76, 114, 175),
          defaultDayColor: Theme.of(context).colorScheme.onPrimary,
          selectedColor: Theme.of(context).colorScheme.secondaryContainer,
          selectedTodayColor: Theme.of(context).colorScheme.primaryContainer,
          todayColor: Theme.of(context).colorScheme.secondaryContainer,
          eventColor: Colors.pink,
          locale: 'en_US',
          todayButtonText: 'Today',
          allDayEventText: 'Allday',
          multiDayEndText: 'Finish',
          isExpanded: true,
          expandableDateFormat: 'EEEE, dd. MMMM yyyy',
          datePickerType: DatePickerType.date,
          dayOfWeekStyle: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontWeight: FontWeight.w800,
              fontSize: 11),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}

abstract class CalendarController extends StateNotifier<CalendarModel> {
  CalendarController(CalendarModel state) : super(state);
}
