import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';
import 'package:buddybuilder/components/draggable.dart';
import 'package:buddybuilder/pages/rotation/rotation_model.dart';

import 'package:buddybuilder/components/pillbutton.dart';

class RotationView extends ConsumerWidget {
  const RotationView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final RotationController controller =
        ref.read(providers.rotationControllerProvider.notifier);
    final RotationModel model = ref.watch(providers.rotationControllerProvider);

    return Scaffold(
      appBar: GymAppBar(
        subTitle: 'Weekly Split',
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
                DraggableButtonRow(),
                //const WeekSelector(),

                // Rest of the widgets
              ],
            ),
          ),
        ),
      ),
    );
  }
}

abstract class RotationController extends StateNotifier<RotationModel> {
  RotationController(RotationModel state) : super(state);
}
