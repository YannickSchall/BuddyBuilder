import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/ui-kit/htwg_text.dart';
import 'package:buddybuilder/components/appbar.dart';
import 'package:buddybuilder/components/pillbutton.dart';
import 'package:buddybuilder/components/containerbutton.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  Widget get firstTree =>
      const HTWGText('SommerSemester 2022', 'HTWG-First-App');

  Widget get secondTree =>
      const HTWGText('WinterSemester 2022/2023', 'HTWG-First-App');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomeController controller =
        ref.read(providers.homeControllerProvider.notifier);
    final HomeModel model = ref.watch(providers.homeControllerProvider);

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
            const SizedBox(height: 30),

            /*
            ElevatedButton(
              onPressed: () => controller.switchtTree(),
              child: const Text('Switch Tree'),
            ),*/
            PillButtonWidget(onPressed: () {}, text: 'Calender'),
            ContainerButtonWidget(
              onPressed: () {},
              text: 'Start Training',
            ),
            PillButtonWidget(onPressed: () {}, text: 'Settings'),
            PillButtonWidget(onPressed: () {}, text: 'Build Plan'),
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
