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

    final futureplansProvider = FutureProvider<List<Plan>>((ref) async {
      return controller.getAllPlans();
    });

    void showSuccessDialog(BuildContext context) {
      final TextEditingController textFieldController = TextEditingController();

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Success Dialog'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: textFieldController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Plan title',
                  ),
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                Consumer(
                  builder: (context, ref, _) {
                    final asyncValue = ref.watch(futureplansProvider);
                    return asyncValue.when(
                      data: (plans) {
                        if (plans != null && plans.isNotEmpty) {
                          return Column(
                            children: [
                              for (final plan in plans)
                                Dismissible(
                                  key: UniqueKey(),
                                  direction: DismissDirection.startToEnd,
                                  onDismissed: (_) {
                                    controller.removePlan(plan.id!);
                                  },
                                  background: Container(
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.only(left: 16.0),
                                    color: Colors.blue,
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.white,
                                    ),
                                  ),
                                  child: PillButtonWidget(
                                    onPressed: () =>
                                        Navigator.pushNamed(context, '/new'),
                                    text: plan.name!,
                                    buttonHeight: 60.0,
                                    buttonWidth: 300.0,
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 8.0),
                                  ),
                                ),
                            ],
                          );
                        } else {
                          return const Text('No plans found');
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

abstract class PlanController extends StateNotifier<PlanModel> {
  PlanController(PlanModel state) : super(state);
  void addPlan(Plan plan);
  void removePlan(int id);
  Future<List<Plan>> getAllPlans();
  Future<int> getNewestPlanID();
}
