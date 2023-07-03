import 'package:isar/isar.dart';

part 'list_exercise.g.dart';

@Collection()
class ListExercise {
  Id? id;

  @Index()
  String? name;
}
