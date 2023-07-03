import 'package:isar/isar.dart';

part 'plan.g.dart';

@Collection()
class Plan {
  Id? id;

  @Index()
  String? name;
  List<Split>? splits;
}

@embedded
class Split {
  late int id;

  late String name;
  late List<Exercise> exercises;
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
