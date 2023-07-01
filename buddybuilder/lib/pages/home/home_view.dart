import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/containerbutton.dart';
import 'package:buddybuilder/material_theme/customicon.dart';
import 'package:buddybuilder/components/datewidget.dart';
import 'package:buddybuilder/material_theme/color_schemes.g.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

    return Scaffold(
      appBar: GymAppBar(
        title: 'BUDDY\nBUILDER',
        titleAlignment: Alignment.centerRight,
        showBackButton: false,
        showOkButton: false,
        onBackButtonPressed: () {},
        onOkButtonPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PillButtonWidget(
              onPressed: () => Navigator.pushNamed(context, '/calendar'),
              text: 'CALENDAR',
              dateWidget: const DayMonthWidget(),
              buttonHeight: 120.0,
            ),
            ContainerButtonWidget(
              onPressed: () => Navigator.pushNamed(context, '/training'),
              text:
                  'PULL', // TODO: add method to switch training according to day
              containerIcon: Icon(Icons.more_horiz,
                  color: Theme.of(context).colorScheme.primary),
            ),
            PillButtonWidget(
                onPressed: () => Navigator.pushNamed(context, '/plan'),
                text: 'BUILD PLAN',
                icon: Icon(CustomIcons.gymplan,
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
            /*
            PillButtonWidget(
                onPressed: () {},
                text: 'SETTINGS',
                icon: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
            */
            CupertinoSwitch(
              value: model.isDarkModeEnabled,
              activeColor: Theme.of(context).colorScheme.onPrimaryContainer,
              onChanged: (value) {
                // Update the state when the switch is toggled
                controller.switchTheme(value);
              },
            )
          ],
        ),
      ),
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);

  void switchTheme(bool switchTheme);
}
