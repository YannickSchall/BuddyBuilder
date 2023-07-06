import 'package:isar/isar.dart';

part 'list_exercise.g.dart';

/* Stores all availabe Exercises by name */

@Collection()
class ListExercise {
  Id? id;

  @Index()
  String? name;
}
