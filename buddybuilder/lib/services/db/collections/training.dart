import 'package:buddybuilder/services/db/collections/split.dart';
import 'package:isar/isar.dart';

part 'training.g.dart';

@Collection()
class Training {
  Id? id;

  @Index()
  String? name;
  late int day;
  late int month;
  late int year;
  late TrainingSplit split;
}

@embedded
class TrainingSplit {
  late int id;

  String? name;
  late List<Exercise>? exercises;
}
