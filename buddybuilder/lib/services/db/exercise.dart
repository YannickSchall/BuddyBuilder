import 'package:isar/isar.dart';

part 'exercise.g.dart';

@Collection()
class Exercise {
  @Index()
  Id? id;
  String? name;
}
