import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';
import 'package:buddybuilder/services/db/collections/plan.dart';
import 'package:http/http.dart' as http;

class DBService {
  final Isar isar;
  late Stream<int> newestIdStream;

  DBService({required this.isar}) {
    _initializeNewestIdStream();
  }

  void _initializeNewestIdStream() {
    newestIdStream = _createNewestIdStream();
  }

  Future<List<ListExercise>> getExercises() async {
    final exercises = await isar.listExercises.where().findAll();

    return exercises
        .map((exercise) => ListExercise()..name = exercise.name ?? "no name")
        .toList();
  }

  void addExercise(ListExercise exercise) async {
    await isar.writeTxn(() async {
      isar.listExercises.put(exercise);
    });
  }

  Future<int> tryNewest(Type type) async {
    dynamic collection;
    int? newest;

    switch (type) {
      case ListExercise:
        collection = isar.collection<ListExercise>();
        final ListExercise? item =
            await isar.listExercises.where(sort: Sort.desc).anyId().findFirst();
        newest = item?.id;
        break;
      case Plan:
        collection = isar.collection<Plan>();

        final Plan? item =
            await isar.plans.where(sort: Sort.desc).anyId().findFirst();
        newest = item?.id;
        break;
      default:
        newest = 1000;
    }

    return newest ?? 0;
  }

  Stream<int> getNewestID() {
    return newestIdStream;
  }

  Stream<int> _createNewestIdStream() {
    return Stream.periodic(const Duration(milliseconds: 100), (_) async {
      final clientId =
          await isar.listExercises.where(sort: Sort.desc).anyId().findFirst();
      return clientId?.id ?? 0;
    }).asyncMap((event) async => await event);
  }

  void receiveFromAPI(List<ListExercise> ls) async {
    List<String> newNames = ls.map((e) => e.name!).toList();

    final allDupes = await isar.listExercises
        .filter()
        .anyOf(newNames, (q, String name) => q.nameEqualTo(name))
        .findAll();

    List<String> allDupeNames = allDupes.map((e) => e.name!).toList();

    List<ListExercise> noDupes =
        ls.where((element) => (!allDupeNames.contains(element.name))).toList();

    await isar.writeTxn(() async {
      isar.listExercises.putAll(noDupes);
    });
  }

/*
  void receiveFromAPI(List<Exercise> ls) async {
    for (var excercise in ls) {
      await isar.writeTxn(() async {
        isar.exercises.put(excercise);
      });
    }
  }
*/
  void clearExercises() async {
    final exercises = isar.listExercises.where().findAllSync();
    final List<int?> ids = exercises.map((exercise) => exercise.id).toList();
    final List<int> validIds = ids.whereType<int>().toList();

    for (final id in validIds) {
      await isar.writeTxnSync(() async {
        isar.listExercises.deleteSync(id!);
      });
    }
  }

  void addPlan(Plan plan) async {
    await isar.writeTxn(() async {
      await isar.plans.put(plan);
    });
  }

  Future<Plan?> getPlan(int id) async {
    return await isar.plans.get(id);
  }

/*
  Future<List<Plan>> getAllPlans() async {
    return await isar.plans
        .where()
        .findAll()
        .include<Split>(PlanFields.splits)
        .include<Exercise>(SplitFields.exercises)
        .include<ExSet>(ExerciseFields.sets)
        .list();
  }
  */

  void removePlan(int id) async {
    await isar.writeTxn(() async {
      isar.plans.delete(id);
    });
  }
}
