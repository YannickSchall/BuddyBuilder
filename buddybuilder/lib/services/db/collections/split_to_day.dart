import 'package:isar/isar.dart';

part 'split_to_day.g.dart';

@Collection()
class SplitToDay {
  Id? id;
  late String weekday;

  @Index()
  String? name;
  late int splitID;
}
