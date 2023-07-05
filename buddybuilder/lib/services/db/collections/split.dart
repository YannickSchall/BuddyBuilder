import 'package:isar/isar.dart';

part 'split.g.dart';

@Collection()
class Split {
  Id? id;

  @Index()
  String? name;
  List<Exercise>? exercises;
}

@embedded
class Exercise {
  late int id;

  String? name;
  List<ExSet>? sets;
}

@embedded
class ExSet {
  late int id;

  late double kg;
  late int reps;
}
