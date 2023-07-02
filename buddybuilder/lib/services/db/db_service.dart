import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/book.dart';
import 'package:http/http.dart' as http;

class DBService {
  final Isar isar;
  late Stream<int> newestIdStream;

  DBService({required this.isar}) {
    _initializeNewestIdStream();
  }

  void _initializeNewestIdStream() {
    newestIdStream = _createNewestIdStream();
  }

  Future<List<Book>> getBooks() async {
    final books = await isar.books.where().findAll();

    return books
        .map((book) => Book()
          ..title = book.title ?? "no title"
          ..author = book.author ?? "no author")
        .toList();
  }

  void addBook(Book book) async {
    await isar.writeTxn(() async {
      isar.books.put(book);
    });
  }

  Stream<int> getNewestID() {
    return newestIdStream;
  }

  Stream<int> _createNewestIdStream() {
    return Stream.periodic(const Duration(milliseconds: 100), (_) async {
      final clientId =
          await isar.books.where(sort: Sort.desc).anyId().findFirst();
      return clientId?.id ?? 0;
    }).asyncMap((event) async => await event);
  }

  void clearBooks() async {
    final books = isar.books.where().findAllSync();
    final List<int?> ids = books.map((book) => book.id).toList();
    final List<int> validIds = ids.whereType<int>().toList();

    for (final id in validIds) {
      await isar.writeTxnSync(() async {
        isar.books.deleteSync(id!);
      });
    }
  }
}
