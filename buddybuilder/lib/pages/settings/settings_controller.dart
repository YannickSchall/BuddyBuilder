import 'package:buddybuilder/pages/settings/settings_model.dart';
import 'package:buddybuilder/pages/settings/settings_view.dart';
import 'package:buddybuilder/services/api/api_service.dart';

class SettingsControllerImplementation extends SettingsController {
  SettingsControllerImplementation({
    required this.api,
    SettingsModel? model,
  }) : super(model ?? SettingsModel(isDarkModeEnabled: false));

  APIService api;

  /*
  switchTheme()
  switch dark to light theme 
  */
  @override
  void switchTheme(bool isDarkModeEnabled) {
    // Update the theme in the state
    state = state.copyWith(isDarkModeEnabled: isDarkModeEnabled);
  }

  /*
  fetchToDB()
  one time action to fill exercises from API 
  */
  @override
  void fetchToDB() async {
    api.fillDatabase();
  }
}
