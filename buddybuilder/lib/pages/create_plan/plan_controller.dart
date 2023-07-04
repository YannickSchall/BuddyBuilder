import 'package:buddybuilder/pages/create_plan/plan_model.dart';
import 'package:buddybuilder/pages/create_plan/plan_view.dart';
import 'package:buddybuilder/services/db/collections/plan.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:flutter/foundation.dart';

class PlanControllerImplementation extends PlanController {
  PlanControllerImplementation({
    PlanModel? model,
    required this.db,
  }) : super(model ?? const PlanModel(id: 0,  name: "",plans: [],splits: []));

  DBService db;
  // List of plan titles
  final List<Plan> _plans = [];

  List<Plan> get plans => _plans;

  @override
  Future<List<Plan>> getAllPlans() {
    final response = db.getAllPlans();
    return response;
  }

  @override
  void addPlan(Plan plan) async {
    int id = await db.tryNewest(Plan) + 1;
    plan.id = id;
    state = state.copyWith(plans: [...state.plans, plan]);
    db.addPlan(plan); // Save the plan title to the database
  }

  @override
  Future<int> getNewestPlanID() async {
    return await db.tryNewest(Plan);
  }

  @override
  void removePlan(int id) {
    state = state.copyWith(
      plans: [
        ...state.plans
      ] // Create a new list using spread operator
        ..removeWhere((item) => item.id == id),
    );
    db.removePlan(id); // Remove the plan title from the database
  }
}
