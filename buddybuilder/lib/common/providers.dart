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
import 'package:buddybuilder/pages/create_plan/01_plans/plans_controller.dart';
import 'package:buddybuilder/pages/create_plan/01_plans/plans_model.dart';
import 'package:buddybuilder/pages/create_plan/01_plans/plans_view.dart';
import 'package:buddybuilder/pages/create_plan/02_split/split_controller.dart';
import 'package:buddybuilder/pages/create_plan/02_split/split_model.dart';
import 'package:buddybuilder/pages/create_plan/02_split/split_view.dart';
import 'package:buddybuilder/pages/create_plan/03_workout/workout_controller.dart';
import 'package:buddybuilder/pages/create_plan/03_workout/workout_model.dart';
import 'package:buddybuilder/pages/create_plan/03_workout/workout_view.dart';
import 'package:buddybuilder/pages/create_plan/04_set/set_controller.dart';
import 'package:buddybuilder/pages/create_plan/04_set/set_model.dart';
import 'package:buddybuilder/pages/create_plan/04_set/set_view.dart';
import 'package:buddybuilder/pages/calendar/calendar_controller.dart';
import 'package:buddybuilder/pages/calendar/calendar_model.dart';
import 'package:buddybuilder/pages/calendar/calendar_view.dart';
import 'package:buddybuilder/pages/weekLY/weekly_controller.dart';
import 'package:buddybuilder/pages/weekly/weekly_model.dart';
import 'package:buddybuilder/pages/weekly/weekly_view.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_view.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_model.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_controller.dart';
import 'package:buddybuilder/pages/rotation/rotation_model.dart';
import 'package:buddybuilder/pages/rotation/rotation_view.dart';
import 'package:buddybuilder/pages/rotation/rotation_controller.dart';
import 'package:buddybuilder/services/db/isar_database.dart';

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

  final StateNotifierProvider<PlanController, TrainingPlan>
      planControllerProvider =
      StateNotifierProvider<PlanController, TrainingPlan>(
          (StateNotifierProviderRef ref) => PlanControllerImplementation());

  final StateNotifierProvider<SplitController, TrainingSplit>
      splitControllerProvider =
      StateNotifierProvider<SplitController, TrainingSplit>(
          (StateNotifierProviderRef ref) => SplitControllerImplementation());

  final StateNotifierProvider<WorkoutController, Workout>
      workoutControllerProvider =
      StateNotifierProvider<WorkoutController, Workout>(
          (StateNotifierProviderRef ref) => WorkoutControllerImplementation());

  final StateNotifierProvider<SetController, ExerciseSet>
      setControllerProvider = StateNotifierProvider<SetController, ExerciseSet>(
          (StateNotifierProviderRef ref) => SetControllerImplementation());

  final StateNotifierProvider<CalendarController, CalendarModel>
      calendarControllerProvider =
      StateNotifierProvider<CalendarController, CalendarModel>(
          (StateNotifierProviderRef ref) => CalendarControllerImplementation());

  final StateNotifierProvider<WeeklyController, WeeklyModel>
      weeklyControllerProvider =
      StateNotifierProvider<WeeklyController, WeeklyModel>(
          (StateNotifierProviderRef ref) => WeeklyControllerImplementation());

  final StateNotifierProvider<NewSplitController, NewSplitModel>
      newsplitControllerProvider =
      StateNotifierProvider<NewSplitController, NewSplitModel>(
          (StateNotifierProviderRef ref) =>
              NewSplitControllerImplementation(db: db, api: api));

  final StateNotifierProvider<RotationController, RotationModel>
      rotationControllerProvider =
      StateNotifierProvider<RotationController, RotationModel>(
          (StateNotifierProviderRef ref) => RotationControllerImplementation());

  final gymProvider = Provider.family<int, int>((ref, id) {
    return id;
  });

  final setWidgetProvider = Provider.family<SetWidget, int>((ref, id) {
    return SetWidget(
      setTitle: 'HALLÖ',
      kgValue: '1',
      repsValue: '1',
      onPressed:
          ref.read(providers.newsplitControllerProvider.notifier).removeWorkout,
    );
  });
}
