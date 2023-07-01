import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/exercise_list.dart';
import 'package:buddybuilder/components/searchbar.dart';

class NewSplitView extends ConsumerWidget {
  const NewSplitView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final NewSplitController controller =
        ref.read(providers.newsplitControllerProvider.notifier);
    final NewSplitModel model = ref.watch(providers.newsplitControllerProvider);

    void showSuccessDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Your search bar and buttons here
                  MySearchBar(
                    onChanged: (query) {
                      ref
                          .read(providers.weeklyControllerProvider.notifier)
                          .updateQuery(
                              query); // Update the query in the controller
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PillButtonWidget(
                        onPressed: () {
                          // Handle button 1 press
                        },
                        text: 'x',
                        buttonHeight: 20.0,
                        buttonWidth: 100.0,
                      ),
                      const Spacer(),
                      PillButtonWidget(
                        onPressed: () {
                          // Handle button 2 press
                        },
                        text: 'create',
                        buttonHeight: 20.0,
                        buttonWidth: 100.0,
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        ExerciseWidget(
                          name: model.workoutTitle,
                          onPressed: controller.addWorkout,
                        ),
                        ExerciseWidget(
                          name: 'name',
                          onPressed: controller.addWorkout,
                        ),
                        ExerciseWidget(
                          name: 'name',
                          onPressed: controller.addWorkout,
                        ),
                        ExerciseWidget(
                          name: 'name',
                          onPressed: controller.addWorkout,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: GymAppBar(
        subTitle: 'New Split',
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'week',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.pink,
                    ),
                  ),
                ),
                PillButtonWidget(
                  onPressed: () {
                    // Open full-screen popup dialog here
                    showSuccessDialog();
                  },
                  text: 'add workout',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class NewSplitController extends StateNotifier<NewSplitModel> {
  NewSplitController(NewSplitModel state) : super(state);
  void addWorkout(String name);
}
