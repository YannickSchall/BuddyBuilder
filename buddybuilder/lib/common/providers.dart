import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/pages/home_page/home_page_controller.dart';
import 'package:buddybuilder/pages/home_page/home_page_model.dart';
import 'package:buddybuilder/pages/home_page/home_page_view.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<HomePageController, HomePageModel>
      homePageControllerProvider =
      StateNotifierProvider<HomePageController, HomePageModel>(
          (StateNotifierProviderRef ref) => HomePageControllerImplmentation());
}
