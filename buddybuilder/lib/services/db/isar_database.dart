import 'package:buddybuilder/services/db/collections/list_exercise.dart';
import 'package:buddybuilder/services/db/collections/plan.dart';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class IsarDatabase {
  static final instance = IsarDatabase._internal();

  late Isar _isar;

  factory IsarDatabase() {
    return instance;
  }

  IsarDatabase._internal();

  Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    _isar = await Isar.open(
      [ListExerciseSchema, PlanSchema],
      directory: dir.path,
    );
  }

  Isar get isar {
    return _isar;
  }
}
