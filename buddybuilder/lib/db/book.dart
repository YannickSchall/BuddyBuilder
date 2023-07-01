import 'package:isar/isar.dart';

part 'book.g.dart';

@Collection()
class Book {
  @Index()
  Id? id;
  String? title;
  String? author;
}
