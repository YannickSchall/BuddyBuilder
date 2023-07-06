import 'package:isar/isar.dart';

part 'split_to_day.g.dart';

/* Stores all Splits mapped to a day, using splitID as foreign key to match with DB Split */

@Collection()
class SplitToDay {
  Id? id;
  late String weekday;

  @Index()
  String? name;
  late int splitID;
}
