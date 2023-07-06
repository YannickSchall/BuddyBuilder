//import 'package:buddybuilder/db/book_model.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';
import 'package:buddybuilder/services/db/isar_database.dart';
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
              buttonHeight: 100.0,
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
            PillButtonWidget(
                onPressed: () => Navigator.pushNamed(context, '/settings'),
                text: 'SETTINGS',
                icon: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ],
        ),
      ),
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);
}
