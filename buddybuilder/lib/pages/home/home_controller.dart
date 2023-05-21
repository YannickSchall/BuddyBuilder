import 'package:myapp/htwg-app/mvc_riverpod/home/home_model.dart';
import 'package:myapp/htwg-app/mvc_riverpod/home/home_view.dart';

class HomeControllerImplmentation extends HomeController {
  HomeControllerImplmentation({
    HomeModel? model,
  }) : super(model ?? const HomeModel(switchTree: false));

  @override
  void switchtTree() {
    state = state.copyWith(switchTree: !state.switchTree);
  }
}
