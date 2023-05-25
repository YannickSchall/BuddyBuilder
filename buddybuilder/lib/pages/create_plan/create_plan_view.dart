import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/create_plan/create_plan_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

class PlanView extends ConsumerWidget {
  const PlanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final PlanController controller =
        ref.read(providers.planControllerProvider.notifier);
    final PlanModel model = ref.watch(providers.planControllerProvider);

    return Scaffold(
      appBar: GymAppBar(
        title: 'BUDDY\nBUILDER',
        titleAlignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: false,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //model.switchTree ? firstTree : secondTree,
              //const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

abstract class PlanController extends StateNotifier<PlanModel> {
  PlanController(PlanModel state) : super(state);
}
