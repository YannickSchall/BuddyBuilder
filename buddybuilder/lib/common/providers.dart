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
      planControllerProvider =
      StateNotifierProvider<PlanController, PlanModel>(
          (StateNotifierProviderRef ref) => PlanControllerImplementation());
}
