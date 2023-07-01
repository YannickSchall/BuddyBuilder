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
import 'package:buddybuilder/pages/calendar/calendar/calendar_controller.dart';
import 'package:buddybuilder/pages/calendar/calendar/calendar_model.dart';
import 'package:buddybuilder/pages/calendar/calendar/calendar_view.dart';
import 'package:buddybuilder/pages/splits/weekly/weekly_controller.dart';
import 'package:buddybuilder/pages/splits/weekly/weekly_model.dart';
import 'package:buddybuilder/pages/splits/weekly/weekly_view.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_view.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_model.dart';
import 'package:buddybuilder/pages/create_plan/new_split/new_split_controller.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider = StateNotifierProvider<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) => HomeControllerImplementation());

  final StateNotifierProvider<TrainingController, TrainingModel>
      trainingControllerProvider =
      StateNotifierProvider<TrainingController, TrainingModel>(
          (StateNotifierProviderRef ref) => TrainingControllerImplementation());

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
          (StateNotifierProviderRef ref) => NewSplitControllerImplementation());
}
