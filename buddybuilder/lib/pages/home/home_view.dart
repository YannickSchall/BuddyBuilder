import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/htwg-app/mvc_riverpod/common/providers.dart';
import 'package:myapp/htwg-app/mvc_riverpod/home/home_model.dart';
import 'package:myapp/htwg-app/mvc_riverpod/ui-kit/htwg_text.dart';

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

abstract class HomeController extends StateNotifier<HomeModel> {
  HomeController(HomeModel state) : super(state);

  void switchtTree();
}
