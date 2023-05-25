import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/training/training_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/exercise.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

class TrainingView extends ConsumerWidget {
  const TrainingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TrainingController controller =
        ref.read(providers.trainingControllerProvider.notifier);
    final TrainingModel model = ref.watch(providers.trainingControllerProvider);

    return Scaffold(
      appBar: GymAppBar(
        customdata: 'BUDDY\nBUILDER',
        titlealignment: Alignment.centerRight,
        showBackButton: true,
        showOkButton: false,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //model.switchTree ? firstTree : secondTree,
            //const SizedBox(height: 30),
            ExerciseWidget(),
          ],
        ),
      ),
    );
  }
}

abstract class TrainingController extends StateNotifier<TrainingModel> {
  TrainingController(TrainingModel state) : super(state);
}
