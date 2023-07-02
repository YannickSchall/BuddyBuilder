import 'dart:convert';
import 'package:buddybuilder/pages/home/home_model.dart';
import 'package:buddybuilder/pages/home/home_view.dart';
import 'package:buddybuilder/services/api/api_service.dart';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/book.dart';
import 'package:http/http.dart' as http;

class HomeControllerImplementation extends HomeController {
  late Stream<int> newestIdStream;
  DBService db;
  APIService api;

  HomeControllerImplementation({
    required this.db,
    required this.api,
    HomeModel? model,
  }) : super(model ?? HomeModel(isDarkModeEnabled: false));

  @override
  Future<List<Book>> getBooks() {
    return db.getBooks();
  }

  @override
  void addBook(Book book) {
    db.addBook(book);
  }

  @override
  Stream<int> getNewestID() {
    return db.getNewestID();
  }

  @override
  void clearBooks() {
    db.clearBooks();
  }

//----------------------------------------------

  @override
  Future<String> provideAPIresponse(String param) async {
    return api.provideAPIresponse(param);
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

  @override
  void createPlan() {}
}
