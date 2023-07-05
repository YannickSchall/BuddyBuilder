import 'package:buddybuilder/components/setwidget.dart';
import 'package:buddybuilder/pages/settings/settings_controller.dart';
import 'package:buddybuilder/pages/settings/settings_model.dart';
import 'package:buddybuilder/pages/settings/settings_view.dart';
import 'package:buddybuilder/services/api/api_service.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/pages/home/home_controller.dart';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:buddybuilder/pages/training/training_controller.dart';
import 'package:buddybuilder/pages/training/training_model.dart';
import 'package:buddybuilder/pages/training/training_view.dart';
import 'package:buddybuilder/pages/calendar/calendar_controller.dart';
import 'package:buddybuilder/pages/calendar/calendar_model.dart';
import 'package:buddybuilder/pages/calendar/calendar_view.dart';
import 'package:buddybuilder/pages/weekLY/weekly_controller.dart';
import 'package:buddybuilder/pages/weekly/weekly_model.dart';
import 'package:buddybuilder/pages/weekly/weekly_view.dart';
import 'package:buddybuilder/pages/create_plan/02_edit_split/edit_split_view.dart';
import 'package:buddybuilder/pages/create_plan/02_edit_split/edit_split_model.dart';
import 'package:buddybuilder/pages/create_plan/02_edit_split/edit_split_controller.dart';
import 'package:buddybuilder/pages/rotation/rotation_model.dart';
import 'package:buddybuilder/pages/rotation/rotation_view.dart';
import 'package:buddybuilder/pages/rotation/rotation_controller.dart';
import 'package:buddybuilder/services/db/isar_database.dart';
import 'package:buddybuilder/pages/create_plan/01_edit_plan/edit_plan_model.dart';
import 'package:buddybuilder/pages/create_plan/01_edit_plan/edit_plan_view.dart';
import 'package:buddybuilder/pages/create_plan/01_edit_plan/edit_plan_controller.dart';

final Providers providers = Providers();
final isar = IsarDatabase.instance.isar;
final db = DBService(isar: isar);
final api = APIService(db);

class Providers {
  final StateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider = StateNotifierProvider<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) =>
              HomeControllerImplementation(db: db, api: api));

  final StateNotifierProvider<TrainingController, TrainingModel>
      trainingControllerProvider =
      StateNotifierProvider<TrainingController, TrainingModel>(
          (StateNotifierProviderRef ref) => TrainingControllerImplementation());

  final StateNotifierProvider<SettingsController, SettingsModel>
      settingsControllerProvider =
      StateNotifierProvider<SettingsController, SettingsModel>(
          (StateNotifierProviderRef ref) =>
              SettingsControllerImplementation(api: api));

  final StateNotifierProvider<CalendarController, CalendarModel>
      calendarControllerProvider =
      StateNotifierProvider<CalendarController, CalendarModel>(
          (StateNotifierProviderRef ref) => CalendarControllerImplementation());

  final StateNotifierProvider<WeeklyController, WeeklyModel>
      weeklyControllerProvider =
      StateNotifierProvider<WeeklyController, WeeklyModel>(
          (StateNotifierProviderRef ref) => WeeklyControllerImplementation());

  final StateNotifierProvider<EditSplitController, EditSplitModel>
      editSplitControllerProvider =
      StateNotifierProvider<EditSplitController, EditSplitModel>(
          (StateNotifierProviderRef ref) =>
              EditSplitControllerImplementation(db: db, api: api));

  final StateNotifierProvider<RotationController, RotationModel>
      rotationControllerProvider =
      StateNotifierProvider<RotationController, RotationModel>(
          (StateNotifierProviderRef ref) => RotationControllerImplementation());

  final StateNotifierProvider<EditPlanController, EditPlanModel>
      editPlanControllerProvider =
      StateNotifierProvider<EditPlanController, EditPlanModel>(
          (StateNotifierProviderRef ref) =>
              EditPlanControllerImplementation(db: db));

  final setWidgetProvider = Provider.family<SetWidget, int>((ref, id) {
    final EditSplitController controller =
        ref.read(providers.editSplitControllerProvider.notifier);
    final String workoutTitle = controller.getWorkoutTitle(id);

    return SetWidget(
      setTitle: workoutTitle,
      kgValue: '1',
      repsValue: '1',
      onPressed: (customId) {
        controller.removeWorkout(customId, id);
      },
      customId: id, // Pass the custom ID to SetWidget
    );
  });

}
