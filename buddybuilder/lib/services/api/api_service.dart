import 'dart:convert';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/exercise.dart';
import 'package:http/http.dart' as http;

class APIService {
  late Stream<int> newestIdStream;
  DBService db;

  APIService(this.db);
  //APIService(db);

  Future<String> provideAPIresponse(String param) async {
    final response = await http.get(
      Uri.parse(
          'https://wger.de/api/v2/exercise/search/?language=2&term=' + param),
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);

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

  void fillDatabase() async {
    final response = await http.get(
      Uri.parse('https://wger.de/api/v2/exercise/search/?language=2'),
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<Exercise> ls = [];

    List<dynamic> results = jsonData['suggestions'];

    int newestID = await db.tryNewest();

    for (var result in results) {
      final exercise = Exercise()
        ..id = newestID + 1
        ..name = result['name'];

      ls.add(exercise);
    }

    db.receiveFromAPI(ls);
  }
}
