import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/pages/homepage/home_page_controller.dart';
import 'package:buddybuilder/pages/home-page/home_page_model.dart';
import '../../common/providers.dart';

class HomePageView extends ConsumerWidget {
  const HomePageView({Key? key}) : super(key: key);

  Widget get firstTree => const Text('SommerSemester 2022');

  Widget get secondTree => const Text('WinterSemester 2022/2023');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final HomePageController controller =
        ref.read(providers.homePageControllerProvider.notifier);
    final HomePageView model = ref.watch(providers.homePageControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Flutter App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            model.switchTree ? firstTree : secondTree,
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
