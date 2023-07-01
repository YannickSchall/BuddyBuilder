import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:isar/isar.dart';
import 'package:buddybuilder/db/book_model.dart';
import 'package:buddybuilder/db/book.dart';

class HomeControllerImplementation extends HomeController {
  final Isar isar;
  late final Stream<int> newestIdStream;
  bool isNewestIdStreamInitialized = false;

  HomeControllerImplementation({
    required this.isar,
    HomeModel? model,
  }) : super(model ?? HomeModel(isDarkModeEnabled: false)) {
    initializeNewestIdStream();
  }

  void initializeNewestIdStream() async {
    final clientId =
        await isar.books.where(sort: Sort.desc).anyId().findFirstSync();
    newestIdStream = _createNewestIdStream(clientId?.id ?? 0);
    isNewestIdStreamInitialized = true;
    // Notify listeners or update the state to indicate that the stream is initialized
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
    await isar.writeTxnSync(() async {
      isar.books.putSync(book);
    });
  }

  List<Book>? isb() {
    final b = (isar.books.where().findAllSync());
    return b;
  }

  //@override
  //Future<int> getNewestID() async {
  //  final clientId = isar.books.where(sort: Sort.desc).anyId().findFirstSync();
  //  print(clientId);
  //  return clientId?.id ?? 0;
  //}

  @override
  Stream<int> getNewestID() {
    if (!isNewestIdStreamInitialized) {
      initializeNewestIdStream();
    }
    return newestIdStream;
  }

  Stream<int> _createNewestIdStream(int initialId) {
    return Stream.periodic(const Duration(seconds: 1), (_) {
      final clientId =
          isar.books.where(sort: Sort.desc).anyId().findFirstSync();
      return clientId?.id ?? initialId;
    });
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
