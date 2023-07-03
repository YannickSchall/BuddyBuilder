import 'package:buddybuilder/services/db/collections/plan.dart';
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
  late Split split;
}
