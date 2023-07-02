import 'dart:convert';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:isar/isar.dart';
import 'package:buddybuilder/db/book.dart';
import 'package:http/http.dart' as http;

class HomeControllerImplementation extends HomeController {
  final Isar isar;
  late Stream<int> newestIdStream;

  HomeControllerImplementation({
    required this.isar,
    HomeModel? model,
  }) : super(model ?? HomeModel(isDarkModeEnabled: false)) {
    _initializeNewestIdStream();
  }

  void _initializeNewestIdStream() {
    newestIdStream = _createNewestIdStream();
  }

  @override
  Future<List<Book>> getBooks() async {
    final books = await isar.books.where().findAll();

    return books
        .map((book) => Book()
          ..title = book.title ?? "no title"
          ..author = book.author ?? "no author")
        .toList();
  }

  @override
  void addBook(Book book) async {
    await isar.writeTxn(() async {
      isar.books.put(book);
    });
  }

  @override
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

  @override
  void clearBooks() async {
    final books = isar.books.where().findAllSync();
    final List<int?> ids = books.map((book) => book.id).toList();
    final List<int> validIds = ids.whereType<int>().toList();

    for (final id in validIds) {
      await isar.writeTxnSync(() async {
        await isar.books.deleteSync(id!);
      });
    }
  }

//----------------------------------------------

  @override
  Future<String> provideAPIresponse(String param) async {
    final response = await http.get(
      Uri.parse(
          'https://wger.de/api/v2/exercise/search/?language=2&term=' + param),
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);

    // Access the decoded data

    final value = jsonData['suggestions'][0]['value'];

    try {
      int count = jsonData['count'];
      final results = jsonData['results'];
      final name = results[0]['name'];
      String next = jsonData['next'];
      String previous = jsonData['previous'];
    } catch (e) {
      print(e);
    }

    return value.toString();
  }

  @override
  void createPlan() {
    // Implement the createPlan method logic here
  }

  @override
  void switchTheme(bool isDarkModeEnabled) {
    // Update the theme in the state
    state = state.copyWith(isDarkModeEnabled: isDarkModeEnabled);
  }
}
