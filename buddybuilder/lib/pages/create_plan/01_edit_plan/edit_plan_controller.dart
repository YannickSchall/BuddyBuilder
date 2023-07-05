import 'package:buddybuilder/pages/create_plan/01_edit_plan/edit_plan_model.dart';
import 'package:buddybuilder/pages/create_plan/01_edit_plan/edit_plan_view.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:flutter/foundation.dart';

class EditPlanControllerImplementation extends EditPlanController {
  EditPlanControllerImplementation({
    EditPlanModel? model,
    required this.db,
  }) : super(model ?? const EditPlanModel(id: 0, name: "", splits: []));

  DBService db;
  // List of split titles
  final List<Split> _splits = [];

  List<Split> get splits => _splits;

  @override
  Future<List<Split>> getAllSplits() {
    final response = db.getAllSplits();
    return response;
  }

  @override
  void addSplit(Split split) async {
    int id = await db.tryNewest(Split) + 1;
    split.id = id;
    state = state.copyWith(splits: [...state.splits, split]);
    db.addSplit(split); // Save the plan title to the database
  }

  @override
  Future<int> getNewestSplitID() async {
    return await db.tryNewest(Split);
  }

  @override
  void removeSplit(int id) {
    state = state.copyWith(
      splits: [...state.splits] // Create a new list using spread operator
        ..removeWhere((item) => item.id == id),
    );
    db.removeSplit(id); // Remove the plan title from the database
  }

  @override
  int? getSelectedId(int id) {
    return state.splits[id].id;
  }
}
