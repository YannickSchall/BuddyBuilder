import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:buddybuilder/pages/home/home_controller.dart';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:buddybuilder/pages/training/training_controller.dart';
import 'package:buddybuilder/pages/training/training_model.dart';
import 'package:buddybuilder/pages/training/training_view.dart';
import 'package:buddybuilder/pages/create_plan/create_plan_controller.dart';
import 'package:buddybuilder/pages/create_plan/create_plan_model.dart';
import 'package:buddybuilder/pages/create_plan/create_plan_view.dart';
import 'package:buddybuilder/pages/calendar/calendar/calendar_controller.dart';
import 'package:buddybuilder/pages/calendar/calendar/calendar_model.dart';
import 'package:buddybuilder/pages/calendar/calendar/calendar_view.dart';

final Providers providers = Providers();

class Providers {
  final StateNotifierProvider<HomeController, HomeModel>
      homeControllerProvider = StateNotifierProvider<HomeController, HomeModel>(
          (StateNotifierProviderRef ref) => HomeControllerImplementation());

  final StateNotifierProvider<TrainingController, TrainingModel>
      trainingControllerProvider =
      StateNotifierProvider<TrainingController, TrainingModel>(
          (StateNotifierProviderRef ref) => TrainingControllerImplementation());

  final StateNotifierProvider<PlanController, PlanModel>
      planControllerProvider = StateNotifierProvider<PlanController, PlanModel>(
          (StateNotifierProviderRef ref) => PlanControllerImplementation());

  final StateNotifierProvider<CalendarController, CalendarModel>
      calendarControllerProvider =
      StateNotifierProvider<CalendarController, CalendarModel>(
          (StateNotifierProviderRef ref) => CalendarControllerImplementation());

  final Provider<String> simpleProvider =
      Provider<String>((_) => "hello world");

/*
  final AutoDisposeStateNotifierProviderFamily<PlanController, PlanModel,
          String> planDetailControllerAutoDisposeFamilyProvider =
      StateNotifierProvider.autoDispose
          .family<PlanController, PlanModel, String>(
              (AutoDisposeStateNotifierProviderRef ref, String id) =>
                  PlanControllerImplementation(
                    id: id,
                  ));

                  */
}
