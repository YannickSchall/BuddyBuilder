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
          return AlertDialog(
            title: Text('Successfully Added $name $id'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  ref
                      .read(providers.weeklyControllerProvider.notifier)
                      .addSplit(model.selectedDay!, id, name);
                },
              ),
            ],
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
          padding: const EdgeInsets.only(left: 16.0),
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
                  style: TextStyle(
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
                      loading: () => Center(
                        child: CircularProgressIndicator(),
                      ),
                      error: (error, stackTrace) => Text('Error: $error'),
                      data: (splits) {
                        if (splits != null && splits.isNotEmpty) {
                          return ListView.builder(
                            itemCount: splits.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
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

abstract class WeeklyController extends StateNotifier<WeeklyModel> {
  WeeklyController(WeeklyModel state) : super(state);

  void updateWeekSelector();
  void updateSelectedDay(String? selectedDay) {
    state = state.copyWith(selectedDay: selectedDay);
  }

  void addSplit(String weekday, int id, String name);
  void updateSearchQuery(String query);
  String getSplitTitle(int id);
  Future<List<Split>> getSplitList();
}
