import 'package:isar/isar.dart';

part 'split.g.dart';

/* Stores all Splits 
- Splits have a name and can store multiple exercises which the store multiple sets 
- each set storing reps and weights of a perofrmed exercise 
*/

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
