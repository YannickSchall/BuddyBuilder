import 'package:buddybuilder/pages/home_page/home_page_model.dart';
import 'package:buddybuilder/pages/home_page/home_page_view.dart';
import 'package:flutter/material.dart';

class HomePageControllerImplmentation extends HomePageController {
  HomePageControllerImplmentation({
    HomePageModel? model,
  }) : super(model ?? const HomePageModel(switchTree: false));

  @override
  void switchtTree() {
    state = state.copyWith(switchTree: !state.switchTree);
  }
}
