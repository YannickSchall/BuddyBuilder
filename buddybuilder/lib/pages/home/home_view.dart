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

/*
  Widget get firstTree =>
      const HTWGText('SommerSemester 2022', 'HTWG-First-App');

  Widget get secondTree =>
      const HTWGText('WinterSemester 2022/2023', 'HTWG-First-App');
*/
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

    return Scaffold(
      appBar: GymAppBar(
        title: 'BUDDY\nBUILDER',
        titleAlignment: Alignment.centerRight,
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

            /*
            ElevatedButton(
              onPressed: () => controller.switchtTree(),
              child: const Text('Switch Tree'),
            ),*/
            //DayMonthWidget(),
            PillButtonWidget(
              onPressed: () {},
              text: 'CALENDAR',
              dateWidget: const DayMonthWidget(),
              buttonHeight: 120.0,
            ),
            ContainerButtonWidget(
              onPressed: () {},
              text:
                  'PULL', // TODO: add method to switch training according to day
              containerIcon: Icon(Icons.more_horiz,
                  color: Theme.of(context).colorScheme.primary),
            ),
            PillButtonWidget(
                onPressed: () {},
                text: 'SETTINGS',
                icon: Icon(Icons.settings,
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
            PillButtonWidget(
                onPressed: () {},
                text: 'BUILD PLAN',
                icon: Icon(CustomIcons.gymplan,
                    color: Theme.of(context).colorScheme.onPrimaryContainer)),
          ],
        ),
      ),
    );
  }
}

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);

  void switchtTree();
}
