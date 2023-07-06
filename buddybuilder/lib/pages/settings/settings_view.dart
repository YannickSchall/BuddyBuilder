import 'package:buddybuilder/components/pillbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/settings/settings_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

class SettingsView extends ConsumerWidget {
  const SettingsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SettingsController controller =
        ref.read(providers.settingsControllerProvider.notifier);
    final SettingsModel model = ref.watch(providers.settingsControllerProvider);

    return Scaffold(
        appBar: GymAppBar(
            subTitle: 'SETTINGS',
            titleAlignment: Alignment.centerRight,
            showBackButton: true,
            showOkButton: false,
            onBackButtonPressed: () => Navigator.pushNamed(context, '/home'),
            onOkButtonPressed: () => {}),
        body: Center(
            child: Column(
          children: [
            PillButtonWidget(
              onPressed: () => controller.fetchToDB(), // fetch from api
              text: 'Fetch from API',
              buttonHeight: 60.0,
            ),
            CupertinoSwitch(
              value: model.isDarkModeEnabled, // tracking value of darkmode
              thumbColor: Theme.of(context).colorScheme.secondaryContainer,
              trackColor: Theme.of(context).colorScheme.primaryContainer,
              activeColor: Theme.of(context).colorScheme.primaryContainer,
              onChanged: (value) {
                controller.switchTheme(value); // pass to controller function
              },
            ),
          ],
        )));
  }
}

abstract class SettingsController extends StateNotifier<SettingsModel> {
  SettingsController(SettingsModel state) : super(state);

  void switchTheme(bool isDarkModeEnabled);
  void fetchToDB();
}
