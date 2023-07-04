import 'package:buddybuilder/components/containerbutton.dart';
import 'package:buddybuilder/services/db/collections/plan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/pages/create_plan/plan_model.dart';
import 'package:buddybuilder/components/pillbutton.dart';

class PlanView extends ConsumerWidget {
  const PlanView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlanController controller =
        ref.read(providers.planControllerProvider.notifier);
    final PlanModel model = ref.watch(providers.planControllerProvider);

    final plansProvider = Provider<List<Plan>>((ref) {
      return model.plans;
    });

    List<Plan> plans = ref.watch(plansProvider);

    void showSuccessDialog(BuildContext context) {
      final TextEditingController textFieldController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Success Dialog'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: textFieldController,
                  decoration: InputDecoration(
                    hintText: 'Enter Plan title',
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        String enteredText = textFieldController.text;
                        Plan newPlan = Plan();
                        newPlan.name = enteredText;

                        // Add the entered text to the list of plan titles
                        controller.addPlan(newPlan);

                        print(enteredText);
                        print(newPlan.id);

                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text('Save'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close the dialog
                      },
                      child: Text('Close'),
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
        subTitle: 'Create Plan',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: true,
        onBackButtonPressed: () => Navigator.pushNamed(context, '/home'),
        onOkButtonPressed: () => Navigator.pushNamed(context, '/new'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContainerButtonWidget(
                  onPressed: () => showSuccessDialog(context),
                  text: 'Create New Plan',
                  containerIcon: const Icon(Icons.add),
                ),
                SizedBox(height: 16),
                for (final plan in plans)
                  Dismissible(
                    key: UniqueKey(), // Add the null-aware operator ! here
                    direction: DismissDirection.startToEnd,
                    onDismissed: (_) {
                      // Remove the plan title from the list
                      controller.removePlan(plan.id!);
                      print('HALLLEEEJULIA');
                      print(plan.id);
                      // Perform any other delete operation here
                    },
                    background: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 16.0),
                      color:
                          Colors.blue, // Customize the delete background color
                      child: Icon(
                        Icons.delete,
                        color: Colors.white, // Customize the delete icon color
                      ),
                    ),
                    child: PillButtonWidget(
                      onPressed: () {
                        // Handle the onPressed action for the pill button
                        // This is where you can navigate to a specific plan or perform other actions
                      },
                      text: plan.name!,
                      buttonHeight: 60.0,
                      buttonWidth: 300.0,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class PlanController extends StateNotifier<PlanModel> {
  PlanController(PlanModel state) : super(state);
  void addPlan(Plan plan);
  void removePlan(int id);
}