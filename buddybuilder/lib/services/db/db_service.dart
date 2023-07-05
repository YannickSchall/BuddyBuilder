import 'dart:convert';
import 'dart:math';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
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

    return exercises.map((exercise) => ListExercise()..name = exercise.name ?? "no name").toList();
  }

  void addExercise(ListExercise exercise) async {
    await isar.writeTxn(() async {
      isar.listExercises.put(exercise);
    });
  }

  Future<List<Exercise>> getExercisesList(int id) async {
    final split = await isar.splits.get(id);
    final exercises = split?.exercises ?? [];
    return exercises;
  }

  Future<int> tryNewest(Type type, [int? splitId]) async {
    dynamic collection;
    int? newest;

    switch (type) {
      case ListExercise:
        collection = isar.collection<ListExercise>();
        final ListExercise? item = await isar.listExercises.where(sort: Sort.desc).anyId().findFirst();
        newest = item?.id;
        break;
      case Split:
        collection = isar.collection<Split>();

        final Split? item = await isar.splits.where(sort: Sort.desc).anyId().findFirst();
        newest = item?.id;
        break;

      case Exercise:
      final split = await isar.splits.get(splitId!);
      if (split != null && split.exercises != null && split.exercises!.isNotEmpty) {
        newest = split.exercises!.map((exercise) => exercise.id).reduce(max);
      }
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
      final clientId = await isar.listExercises.where(sort: Sort.desc).anyId().findFirst();
      return clientId?.id ?? 0;
    }).asyncMap((event) async => await event);
  }

  void receiveFromAPI(List<ListExercise> ls) async {
    List<String> newNames = ls.map((e) => e.name!).toList();

    final allDupes = await isar.listExercises.filter().anyOf(newNames, (q, String name) => q.nameEqualTo(name)).findAll();

    List<String> allDupeNames = allDupes.map((e) => e.name!).toList();

    List<ListExercise> noDupes = ls.where((element) => (!allDupeNames.contains(element.name))).toList();

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

  void addSplit(Split split) async {
    await isar.writeTxn(() async {
      await isar.splits.put(split);
    });
  }

  Future<Split?> getSplit(int id) async {
    return await isar.splits.get(id);
  }

  Future<List<Split>> getAllSplits() async {
    final splits = await isar.splits.where().findAll();
    return splits.map((split) {
      final newSplit = Split()
        ..id = split.id ?? 0 // Set the id property based on the plan's id value
        ..name = split.name ?? "no name"; // Set the name property based on the plan's name value
      return newSplit;
    }).toList();
  }

  void removeSplit(int id) async {
    await isar.writeTxn(() async {
      isar.splits.delete(id);
    });
  }

  void addExerciseToSplit(int splitId, Exercise exercise) async {
    final split = await isar.splits.get(splitId);

    if (split != null) {
      List<Exercise> exercises = split.exercises ?? [];
      var updatedExercises = [...exercises, exercise];
      final updatedSplit = Split()
        ..id = split.id
        ..name = split.name
        ..exercises = updatedExercises;
      await isar.writeTxn(() async {
        await isar.splits.put(updatedSplit);
      });
    }
  }


  void removeExerciseToSplit(int splitId, int exerciseId) async {
  final split = await isar.splits.get(splitId);

  if (split != null) {
    List<Exercise> exercises = split.exercises ?? [];
    var updatedExercises = exercises.where((exercise) => exercise.id != exerciseId).toList();
    
    await isar.writeTxn(() async {
      split.exercises = updatedExercises;
      await isar.splits.put(split);
    });
  }
}

  Future<List<Exercise>> getExercisesListFromSplit(int splitId) async {
    final split = await isar.splits.get(splitId);
    return split?.exercises ?? [];
  }
  
  void addSetToExercise(int splitId, int exerciseId, ExSet set) async {
    final split = await isar.splits.get(splitId);

    if (split != null) {
      final exercises = split.exercises ?? [];
      final exercise = exercises.firstWhere((exercise) => exercise.id == exerciseId);

      if (exercise != null) {
        exercise.sets ??= [];
        exercise.sets?.add(set);
        isar.splits.put(split);
      }
    }
  }
}
