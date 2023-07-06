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

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final CalendarController controller =
        ref.read(providers.calendarControllerProvider.notifier);
    final CalendarModel model = ref.watch(providers.calendarControllerProvider);

    final trainingOfDayProvider =
        FutureProvider<List<Map<String, List<Map<String, String>>>>>(
            (ref) async {
      final overkill = await controller.getOverkill();
      final parsedOverkill = overkill.map((item) {
        final exercises = item['exercises'] ?? [];
        final parsedExercises = exercises.map((exercise) {
          return {
            'name': exercise['name']?.toString() ?? '',
            'set': exercise['sets']?.toString() ?? '',
            'id': exercise['id']?.toString() ?? '',
          };
        }).toList();
        return {
          'exercises': parsedExercises,
        };
      }).toList();
      return parsedOverkill;
    });

    List<Widget> popUpList = [];

/*
showSucessDialog will show the finished workouts of a day when clicking on the floating action button
- data is filled by controller.getOverkill() via the controller from the db
*/
    void showSuccessDialog(BuildContext context, WidgetRef ref) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Consumer(
        builder: (context, ref, _) {
          void reloadExercises() {
            ref.refresh(trainingOfDayProvider);
          }

          return GestureDetector(
            onTap: () {
              // Close the dialog when tapped outside
              Navigator.of(context).pop();
            },
            child: SingleChildScrollView(
              child: Dialog(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FutureBuilder<List<Map<String, List<Map<String, String>>>>>(
                    future: controller.getOverkill(),
                    builder: (BuildContext context, AsyncSnapshot<List<Map<String, List<Map<String, String>>>>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return const Text("Calendar couldn't be created");
                      } else {
                        var l = snapshot.data!;
                        for (var i = 0; i < l.length; i++) {
                          var name = l[i].keys.toList()[0];
                          print("name: " + name);
                          var setData = l[i].values.toList()[0];
                          popUpList.add(CalendarListWidget(name: name, id: i, setData: setData));
                        }

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: popUpList,
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      );
    },
  );
}



    var _eventList;

    return Scaffold(
      appBar: GymAppBar(
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
                weekDays: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
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

abstract class CalendarController extends StateNotifier<CalendarModel> {
  CalendarController(CalendarModel state) : super(state);
  void updateSelectedDate(DateTime selectedDate);
  Future<List<Map<String, List<Map<String, String>>>>> getOverkill();
}
