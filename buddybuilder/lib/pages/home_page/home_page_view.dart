import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/pages/home_page/home_page_controller.dart';
import 'package:buddybuilder/pages/home_page/home_page_model.dart';
import 'package:buddybuilder/common/providers.dart';
import 'package:buddybuilder/pages/home_page/ui-kit/htwg_text.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  Widget get firstTree =>
      const HTWGText('SommerSemester 2022', 'HTWG-First-App');

  Widget get secondTree =>
      const HTWGText('WinterSemester 2022/2023', 'HTWG-First-App');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomePageController controller =
        ref.read(providers.homePageControllerProvider.notifier);
    final HomePageView model = ref.watch(providers.homePageControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('BuddyBuilder App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //model.switchTree ? firstTree : secondTree,
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => controller.switchtTree(),
              child: const Text('Switch Tree'),
            ),
          ],
        ),
      ),
    );
  }
}

abstract class HomePageController extends StateNotifier<HomePageModel> {
  HomePageController(HomePageModel state) : super(state);

  void switchtTree();
}
