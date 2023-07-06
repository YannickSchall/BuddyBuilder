import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/weekly/weekly_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/weekdayselector.dart';
import 'package:buddybuilder/components/searchbar.dart';

class WeeklyView extends ConsumerWidget {
  const WeeklyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WeeklyController controller =
        ref.read(providers.weeklyControllerProvider.notifier);
    final WeeklyModel model = ref.watch(providers.weeklyControllerProvider);

    Future<String> content(String name) async {
      String day = mapDay(model.selectedDay ?? "");
      String shortDay = day.substring(0, 3).toUpperCase();
      String message = '';
      String currentName = await controller.checkName(name, shortDay);

      if (name == currentName) {
        message = 'Exercise "$name" is already selected for $day.';
      } else {
        message = 'Replace exercise "$currentName" with "$name" for $day?';
      }

      if (currentName == "Not found") {
        message = 'Add exercise "$name" to $day?';
      }

      return message;
    }

    final splitsProvider = FutureProvider<List<Split>>((ref) async {
      return controller.getSplitList();
    });

    void reloadSplits() {
      ref.refresh(splitsProvider);
    }

    void showSuccessDialog(String name, int id) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return FutureBuilder<String>(
            future: content(name),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return AlertDialog(
                  title: Text(
                    'Loading...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return AlertDialog(
                  title: Text(
                    'Error: ${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                );
              } else {
                return AlertDialog(
                  title: Text(
                    snapshot.data!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                    ),
                  ),
                  actions: [
                    MaterialButton(
                      child: const Text('Cancel', textAlign: TextAlign.left),
                      color: Theme.of(context).colorScheme.primary,
                      textColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    MaterialButton(
                      child: const Text('OK', textAlign: TextAlign.left),
                      color: Theme.of(context).colorScheme.primary,
                      textColor:
                          Theme.of(context).colorScheme.secondaryContainer,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                        ref
                            .read(providers.weeklyControllerProvider.notifier)
                            .addSplit(model.selectedDay!, id, name);
                      },
                    ),
                  ],
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                );
              }
            },
          );
        },
      );
    }

    return Scaffold(
      appBar: GymAppBar(
        subTitle: 'WEEKLY SPLIT',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: true,
        onBackButtonPressed: () => Navigator.pushNamed(context, '/workout'),
        onOkButtonPressed: () => Navigator.pushNamed(context, '/home'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'DAYS',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
                WeekDaySelector(
                  onDaySelected: (selectedDay) {
                    ref
                        .read(providers.weeklyControllerProvider.notifier)
                        .updateSelectedDay(selectedDay);
                  },
                ),
                Text(
                  'Selected Day: ${model.selectedDay ?? 'None'}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                MySearchBar(
                  onChanged: (query) {
                    ref
                        .read(providers.weeklyControllerProvider.notifier)
                        .updateSearchQuery(query);
                    reloadSplits();
                    print('JESUUUUUSSSS');
                    controller.getSplitList().then((splits) {
                      if (splits.isNotEmpty) {
                        print(splits);
                      } else {
                        print('Empty');
                      }
                    });
                  },
                ),
                Consumer(
                  builder: (context, ref, _) {
                    final asyncValue = ref.watch(splitsProvider);
                    return asyncValue.when(
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, stackTrace) => Text('Error: $error'),
                      data: (splits) {
                        if (splits != null && splits.isNotEmpty) {
                          return ListView.builder(
                            itemCount: splits.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final split = splits[index];
                              return PillButtonWidget(
                                text: split.name ?? 'No name',
                                onPressed: () {
                                  var s = split.name ?? 'No name';
                                  var id = split.id!;
                                  showSuccessDialog(s, id);
                                },
                              );
                            },
                          );
                        } else {
                          return const ListTile(
                            title: Text('No splits available'),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String mapDay(String day) {
  switch (day) {
    case 'MON':
      return "Monday";
    case 'TUE':
      return 'Tuesday';
    case 'WED':
      return 'Wednesday';
    case 'THU':
      return 'Thursday';
    case 'FRI':
      return 'Friday';
    case 'SAT':
      return 'Saturday';
    case 'SUN':
      return 'Sunday';
  }
  return day;
}

abstract class WeeklyController extends StateNotifier<WeeklyModel> {
  WeeklyController(WeeklyModel state) : super(state);

  void updateWeekSelector();
  void updateSelectedDay(String? selectedDay) {
    state = state.copyWith(selectedDay: selectedDay);
  }

  void addSplit(String weekday, int id, String name);
  Future<String> checkName(String newName, String weekday);
  void updateSearchQuery(String query);
  String getSplitTitle(int id);
  Future<List<Split>> getSplitList();
}
