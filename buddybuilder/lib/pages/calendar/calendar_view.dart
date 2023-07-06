import 'package:buddybuilder/components/calendar_list.dart';
import 'package:buddybuilder/services/db/collections/training.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/pages/calendar/calendar_model.dart';

class CalendarView extends ConsumerWidget {
  CalendarView({
    Key? key,
  }) : super(key: key);

  List<Map<String, String>> setData = [
    {
      'set': '1',
      'reps': '8',
      'kg': '10',
    },
    {
      'set': '2',
      'reps': '12',
      'kg': '15',
    },
    {
      'set': '3',
      'reps': '10',
      'kg': '12',
    },
  ];

  List<Map<String, String>> setData1 = [
    {
      'set': '1',
      'reps': '8',
      'kg': '10',
    },
    {
      'set': '2',
      'reps': '12',
      'kg': '15',
    },
    {
      'set': '3',
      'reps': '10',
      'kg': '12',
    },
  ];

  List<Map<String, String>> setData2 = [
    {
      'set': '1',
      'reps': '8',
      'kg': '10',
    },
    {
      'set': '2',
      'reps': '12',
      'kg': '15',
    },
    {
      'set': '3',
      'reps': '10',
      'kg': '12',
    },
  ];

  List<Map<String, String>> setData3 = [
    {
      'set': '1',
      'reps': '8',
      'kg': '10',
    },
    {
      'set': '2',
      'reps': '12',
      'kg': '15',
    },
    {
      'set': '3',
      'reps': '10',
      'kg': '12',
    },
  ];

  void showSuccessDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Consumer(
          builder: (context, ref, _) {
            void reloadExercises() {
              //ref.refresh(exercisesProvider);
            }

            return Expanded(
              child: Dialog(
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CalendarListWidget(name: 'name', id: 1, setData: setData),
                      CalendarListWidget(
                          name: 'name', id: 1, setData: setData1),
                      CalendarListWidget(
                          name: 'name', id: 1, setData: setData2),
                      CalendarListWidget(
                          name: 'name', id: 1, setData: setData2),
                      CalendarListWidget(
                          name: 'name', id: 1, setData: setData2),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

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
        subTitle: 'OVERVIEW',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: false,
        onBackButtonPressed: () => Navigator.pushNamed(context, '/home'),
        onOkButtonPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Calendar(
                startOnMonday: true,
                weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sar', 'Sun'],
                eventsList: _eventList,
                isExpandable: true,
                eventDoneColor: Color.fromARGB(255, 76, 114, 175),
                defaultDayColor: Theme.of(context).colorScheme.onPrimary,
                selectedColor: Theme.of(context).colorScheme.secondaryContainer,
                selectedTodayColor:
                    Theme.of(context).colorScheme.primaryContainer,
                todayColor: Theme.of(context).colorScheme.secondaryContainer,
                eventColor: Colors.pink,
                locale: 'en_US',
                todayButtonText: 'Today',
                allDayEventText: 'Allday',
                multiDayEndText: 'Finish',
                isExpanded: true,
                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                onDateSelected: (DateTime selectedDate) {
                  ref
                      .read(providers.calendarControllerProvider.notifier)
                      .updateSelectedDate(selectedDate);
                },
                datePickerType: DatePickerType.date,
                dayOfWeekStyle: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w800,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSuccessDialog(context, ref);
        },
        child: const Icon(Icons.add),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}

String exampleSplitName(List<Training> trainings) {
  return trainings[0].split.name ?? 'No name';
}

abstract class CalendarController extends StateNotifier<CalendarModel> {
  CalendarController(CalendarModel state) : super(state);
  void updateSelectedDate(DateTime selectedDate);
}
