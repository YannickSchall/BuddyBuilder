import 'package:buddybuilder/components/containerbutton.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/pages/create_plan/01_edit_plan/edit_plan_model.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/pages/create_plan/02_edit_split/edit_split_view.dart';

class EditPlanView extends ConsumerWidget {
  const EditPlanView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final EditPlanController controller =
        ref.read(providers.editPlanControllerProvider.notifier);
    final EditPlanModel model = ref.watch(providers.editPlanControllerProvider);

    final futureSplitsProvider = FutureProvider<List<Split>>((ref) async {
      return controller.getAllSplits();
    });

    /*
    showSucessDialog will open a pop up to enter the name of a split
    - controller.addSPlit will handle the string of the name to db and providers watched list
    */
    void showSuccessDialog(BuildContext context) {
      final TextEditingController textFieldController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Create new split'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: textFieldController,
                  decoration: const InputDecoration(
                    hintText: 'Enter split title',
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        String enteredText = textFieldController.text;
                        Split newSplit = Split();
                        newSplit.name = enteredText;

                        // Add the entered text to the list of split titles into db and watched list
                        controller.addSplit(newSplit);
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('Save'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: const Text('Close'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: GymAppBar(
          subTitle: 'EDIT PLAN',
          titleAlignment: Alignment.centerRight,
          showBackButton: true,
          showOkButton: false,
          onBackButtonPressed: () => Navigator.pushNamed(context, '/home'),
          onOkButtonPressed: () {}),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContainerButtonWidget(
                  onPressed: () => showSuccessDialog(context),
                  text: 'Create New Split',
                  containerIcon: const Icon(Icons.add),
                ),
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, _) {
                    final asyncValue = ref.watch(
                        futureSplitsProvider); // here the fetched data fromm futureSplitsProvider is build
                    return asyncValue.when(
                      data: (splits) {
                        if (splits != null && splits.isNotEmpty) {
                          return Column(
                            children: [
                              for (final split in splits)
                                Dismissible(
                                  key: ValueKey(split.id),
                                  direction: DismissDirection.startToEnd,
                                  onDismissed: (_) {
                                    controller.removeSplit(split.id!);
                                  },
                                  background: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 16.0),
                                    color: Colors.red,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: PillButtonWidget(
                                    onPressed: () {
                                      int splitId = split.id!;
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => EditSplitView(
                                                  splitId: splitId,
                                                )),
                                      );
                                    },
                                    text: split.name!,
                                    buttonHeight: 60.0,
                                    buttonWidth: 300.0,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                  ),
                                ),
                            ],
                          );
                        } else {
                          return const Text('No splits found');
                        }
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stackTrace) =>
                          const Text('Something went wrong'),
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

abstract class EditPlanController extends StateNotifier<EditPlanModel> {
  EditPlanController(EditPlanModel state) : super(state);
  void addSplit(Split split);
  void removeSplit(int id);
  Future<List<Split>> getAllSplits();
}
