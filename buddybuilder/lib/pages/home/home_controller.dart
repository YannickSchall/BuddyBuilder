import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';

class HomeControllerImplementation extends HomeController {
  HomeControllerImplementation({
    HomeModel? model,
  }) : super(model ?? HomeModel(isDarkModeEnabled: false));

  @override
  void createPlan() {}

  @override
  void switchTheme(bool isDarkModeEnabled) {
    // Update the theme in the state
    state = state.copyWith(isDarkModeEnabled: isDarkModeEnabled);
  }
}
