import 'dart:convert';
import 'dart:math';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';
import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:buddybuilder/services/db/collections/split_to_day.dart';

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

  /*
  tryNewest()
  priovide newest id of each type - could not use autincremental - id was always negative 
  */
  Future<int> tryNewest(Type type, [int? splitId, int? exerciseId]) async {
    dynamic collection;
    int? newest;

    switch (type) {
      case ListExercise:
        collection = isar.collection<ListExercise>();
        final ListExercise? item =
            await isar.listExercises.where(sort: Sort.desc).anyId().findFirst();
        newest = item?.id;
        break;
      case Split:
        collection = isar.collection<Split>();
        final Split? item =
            await isar.splits.where(sort: Sort.desc).anyId().findFirst();
        newest = item?.id;
        break;
      case SplitToDay:
        collection = isar.collection<SplitToDay>();
        final SplitToDay? item =
            await isar.splitToDays.where(sort: Sort.desc).anyId().findFirst();
        newest = item?.id;
        break;

      case Exercise:
        final split = await isar.splits.get(splitId!);
        if (split != null &&
            split.exercises != null &&
            split.exercises!.isNotEmpty) {
          newest = split.exercises!.map((exercise) => exercise.id).reduce(max);
        }
        break;

      case ExSet:
        final split = await isar.splits.get(splitId!);
        if (split != null &&
            split.exercises != null &&
            split.exercises!.isNotEmpty) {
          final exercise = split.exercises!
              .firstWhere((element) => element.id == exerciseId);
          if (exercise != null &&
              exercise.sets != null &&
              exercise.sets!.isNotEmpty) {
            newest = exercise.sets!.map((set) => set.id).reduce(max);
          }
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

  /**************************************ListExercise**********************/

  /*
  getExercises()
  getAll Exercises from db
  */
  Future<List<ListExercise>> getExercises() async {
    final exercises = await isar.listExercises.where().findAll();

    return exercises
        .map((exercise) => ListExercise()..name = exercise.name ?? "no name")
        .toList();
  }

  /*
  addExercise()
  add Exercises to db
  */
  void addExercise(ListExercise exercise) async {
    await isar.writeTxn(() async {
      isar.listExercises.put(exercise);
    });
  }

  /*
  getExercisesList()
  get my exercise list from a split
  */
  Future<List<Exercise>> getExercisesList(int id) async {
    final split = await isar.splits.get(id);
    final exercises = split?.exercises ?? [];
    return exercises;
  }

  /*
  getExercisesList()
  get my exercise list from a split
  */
  Stream<int> _createNewestIdStream() {
    return Stream.periodic(const Duration(milliseconds: 100), (_) async {
      final clientId =
          await isar.listExercises.where(sort: Sort.desc).anyId().findFirst();
      return clientId?.id ?? 0;
    }).asyncMap((event) async => await event);
  }

  /*
  receiveFromAPI()
  fetch all exercises from api and store in db 
  */
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
  clearExercises()
  delete exercise by id
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

  /*
  clearExercises()
  delete exercise by id
  */
  void addSplit(Split split) async {
    await isar.writeTxn(() async {
      await isar.splits.put(split);
    });
  }

  /**************************************Split**************************/

  /*
  getSplit()
  get Split by id
  */
  Future<Split?> getSplit(int id) async {
    return await isar.splits.get(id);
  }

  /*
  getSplitNoNull()
  get Split by id - with null safety
  */
  Future<Split> getSplitNoNull(int id) async {
    try {
      final split = await isar.splits.get(id);
      return split ?? Split();
    } catch (e) {
      print('Error retrieving split: $e');
      return Split();
    }
  }

  /*
  getAllSplits()
  get all available splits from db
  */
  Future<List<Split>> getAllSplits() async {
    final splits = await isar.splits.where().findAll();
    return splits.map((split) {
      final newSplit = Split()
        ..id = split.id ?? 0
        ..name = split.name ?? "no name";
      return newSplit;
    }).toList();
  }

  /*
  removeSplit()
  remove split from db
  */
  void removeSplit(int id) async {
    await isar.writeTxn(() async {
      isar.splits.delete(id);
    });
  }

  /*
  removeSplit()
  remove split from db
  */
  void addSplitToDay(SplitToDay split) async {
    final existing = await isar.splitToDays
        .filter()
        .weekdayEqualTo(split.weekday)
        .findFirst();

    if (existing != null) {
      int oldID = existing.id!;
      split.id = oldID;
    }

    await isar.writeTxn(() async {
      isar.splitToDays.put(split);
    });
  }

  /*
  addExerciseToSplit()
  map split id to exercise
  */
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

  /*
  removeExerciseToSplit()
  remove mapping from split id to exercise
  */
  void removeExerciseToSplit(int splitId, int exerciseId) async {
    final split = await isar.splits.get(splitId);

    if (split != null) {
      List<Exercise> exercises = split.exercises ?? [];
      var updatedExercises =
          exercises.where((exercise) => exercise.id != exerciseId).toList();
      split.exercises = updatedExercises;
      await isar.writeTxn(() async {
        await isar.splits.put(split);
      });
    }
  }

  /*
  getExercisesListFromSplit()
  get all exercises mapped to a splitID
  */
  Future<List<Exercise>> getExercisesListFromSplit(int splitId) async {
    final split = await isar.splits.get(splitId);
    return split?.exercises ?? [];
  }

  /*
  addSetToExercise()
  add sets to exercise
  */
  void addSetToExercise(int splitId, int exerciseId, ExSet exSet) async {
    var split = await isar.splits.get(splitId);

    if (split != null) {
      var exercises = split.exercises ?? [];
      final exercise =
          exercises.firstWhere((exercise) => exercise.id == exerciseId);
      final index = exercises.indexWhere((element) => element.id == exerciseId);

      if (exercise != null) {
        exercise.sets ??= [];
        exercise.sets?.add(exSet);
        exercises[index] = exercise;
        split.exercises = exercises;
        await isar.writeTxn(() async {
          isar.splits.put(split);
        });
      }
    }
  }

  /*
  updateSetinExercise()
  update value in sets of an exercise
  */
  void updateSetinExercise(int splitID, int exerciseID, ExSet newExSet) async {
    var split = await isar.splits.get(splitID);

    if (split != null) {
      var exercises = split.exercises ?? [];
      final exercise =
          exercises.firstWhere((exercise) => exercise.id == exerciseID);
      final exerciseIndex =
          exercises.indexWhere((element) => element.id == exerciseID);

      exercise.sets = newExSetList;
      exercises[exerciseIndex] = exercise;
      split.exercises = exercises;

      await isar.writeTxn(() async {
        isar.splits.put(split);
      });
    }
  }

  /*
  removeSetFromExercise()
  remove sets of an exercise
  */
  void removeSetFromExercise(int splitId, int exerciseId, int setId) async {
    final split = await isar.splits.get(splitId);

    if (split != null) {
      final exercises = split.exercises ?? [];
      final exercise =
          exercises.firstWhere((exercise) => exercise.id == exerciseId);

      if (exercise != null) {
        exercise.sets ??= [];
        exercise.sets?.removeWhere((set) => set.id == setId);
        await isar.writeTxn(() async {
          isar.splits.put(split);
        });
      }
    }
  }

  /**************************************SplitToDay**************************/

  /*
  getAllSplitToDays()
  fetch all splits mapped to a day
  */
  Future<List<SplitToDay>> getAllSplitToDays() async {
    final splits = await isar.splitToDays.where().findAll();
    return splits.map((splitToDay) {
      return SplitToDay()
        ..id = splitToDay.id
        ..weekday = splitToDay.weekday
        ..name = splitToDay.name ?? "no name"
        ..splitID = splitToDay.splitID;
    }).toList();
  }

  /*
  getSplitNameFromDay()
  return splitname mapped to TODAY - helper function because it has parameters
  */
  Future<String> getSplitNameFromDay(String weekday) async {
    final split2ds = await isar.splitToDays.where().findAll();
    final splits = await isar.splits.where().findAll();
    String notFound = "Not found";

    final currentSplit2d = split2ds.firstWhere(
        (split) => split.weekday == weekday,
        orElse: () => SplitToDay()..name = notFound);
    if (currentSplit2d.name == notFound) return notFound;

    final split =
        splits.firstWhere((split) => split.id == currentSplit2d.splitID);

    return split.name ?? notFound;
  }

  /*
  getSplitToDayByWeekday() - can be called easily 
  return right split of TODAY
  */
  Future<Split?> getSplitToDayByWeekday() async {
    final split2ds = await getAllSplitToDays();

    String _getWeekday(DateTime date) {
      final weekdays = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN'];
      return weekdays[date.weekday - 1];
    }

    final todayWeekday = _getWeekday(DateTime.now());

    final result = split2ds.firstWhere(
      (splitToDay) => splitToDay.weekday == todayWeekday,
      orElse: () => SplitToDay()
        ..weekday = todayWeekday
        ..name = 'Restday',
    );

    if (result.id == null) {
      return null;
    }

    final splitOfCurrentDay = await getSplitNoNull(result.splitID!);

    return splitOfCurrentDay;
  }

  /*
  getSetOfDay()  
  get todays sets
  */
  Future<List<Exercise>> getSetOfDay() async {
    final todaysSets = await getSplitToDayByWeekday();
    return todaysSets?.exercises ?? [];
  }

  /*
  setToMap()  
  parse data for frontendusage
  */
  Future<List<Map<String, List<Map<String, String>>>>> setToMap() async {
    final exerciseList = await getSetOfDay();
    
    List<Map<String, List<Map<String, String>>>> result = [];

    for (var exercise in exerciseList) {
      List<Map<String, String>> innerList = [];
      String name = exercise.name!;
      final setsOfToday = exercise.sets ?? [];
      final setMapList = setsOfToday.map((set) {
        return {
          'set': set.id.toString(),
          'reps': set.reps.toString(),
          'kg': set.kg.toString()
        };
      }).toList();
      innerList = [...innerList, ...setMapList];
      final innerResult = {name: innerList};

      result = [...result, innerResult];
    }

    return result;
  }

  Future<List<ExSet>> getSetsFromExercise(int splitId, int exerciseId) async {
    final split = await isar.splits.get(splitId);
    if (split != null) {
      final exercises = split.exercises ?? [];
      final exercise = exercises.firstWhere((exercise) => exercise.id == exerciseId);
      return exercise.sets ?? [];
    }
    return [];
  }
}
