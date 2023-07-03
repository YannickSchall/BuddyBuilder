import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/exercise.dart';
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

  Future<List<Exercise>> getExercises() async {
    final exercises = await isar.exercises.where().findAll();

    return exercises
        .map((exercise) => Exercise()..name = exercise.name ?? "no name")
        .toList();
  }

  void addExercise(Exercise exercise) async {
    await isar.writeTxn(() async {
      isar.exercises.put(exercise);
    });
  }

  Future<int> tryNewest() async {
    final newest =
        await isar.exercises.where(sort: Sort.desc).anyId().findFirst();
    return newest?.id ?? 0;
  }

  Stream<int> getNewestID() {
    return newestIdStream;
  }

  Stream<int> _createNewestIdStream() {
    return Stream.periodic(const Duration(milliseconds: 100), (_) async {
      final clientId =
          await isar.exercises.where(sort: Sort.desc).anyId().findFirst();
      return clientId?.id ?? 0;
    }).asyncMap((event) async => await event);
  }

  void receiveFromAPI(List<Exercise> ls) async {
    for (var i = 0; i < ls.length; i++) {
      await isar.writeTxn(() async {
        isar.exercises.put(ls[i]);
      });
    }
  }

  void clearExercises() async {
    final exercises = isar.exercises.where().findAllSync();
    final List<int?> ids = exercises.map((exercise) => exercise.id).toList();
    final List<int> validIds = ids.whereType<int>().toList();

    for (final id in validIds) {
      await isar.writeTxnSync(() async {
        isar.exercises.deleteSync(id!);
      });
    }
  }
}
