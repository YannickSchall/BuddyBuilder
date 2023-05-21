import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';

class HomeControllerImplmentation extends HomeController {
  HomeControllerImplmentation({
    HomeModel? model,
  }) : super(model ?? const HomeModel(switchTree: false));

  @override
  void switchtTree() {
    state = state.copyWith(switchTree: !state.switchTree);
  }
}
