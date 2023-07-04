import 'package:buddybuilder/pages/create_plan/plan_model.dart';
import 'package:buddybuilder/pages/create_plan/plan_view.dart';
import 'package:buddybuilder/services/db/collections/plan.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:flutter/foundation.dart';

class PlanControllerImplementation extends PlanController {
  PlanControllerImplementation({
    PlanModel? model,
    required this.db,
  }) : super(model ?? PlanModel(plans: []));

  DBService db;
  // List of plan titles
  final List<Plan> _plans = [];

  List<Plan> get plans => _plans;

  @override
  List<Plan> getPlan() {
    return _plans;
  }
  /*
  // Add a plan title to the list
  @override
  void addPlanTitle(String title) {
    _planTitles.add(title);
    //db.addPlanTitle(title);

    state = state.copyWith(planTitles: _planTitles);
  }

  @override
  void removePlanTitle(String title) {
    _planTitles.remove(title);
    state = state.copyWith(planTitles: _planTitles);
  }
  */

  @override
  void addPlan(Plan plan) async {
    plan.id = await db.tryNewest(Plan) + 1;
    List<Plan> updatedPlans = [...state.plans, plan];
    state = state.copyWith(plans: updatedPlans);
    db.addPlan(plan); // Save the plan title to the database
  }

  @override
  void removePlan(int id) {
    final updatedPlans = state.plans.where((t) => t != id).toList();
    state = state.copyWith(plans: updatedPlans);
    db.removePlan(id); // Remove the plan title from the database
  }
}
