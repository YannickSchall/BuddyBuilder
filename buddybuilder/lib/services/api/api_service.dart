import 'dart:convert';
import 'package:buddybuilder/services/db/db_service.dart';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/collections/list_exercise.dart';
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
      Uri.parse('https://wger.de/api/v2/exercise/?language=2&limit=999'),
    );

    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<ListExercise> ls = [];
    List<String> names = [];

    List<dynamic> results = jsonData['results'];
    int count = jsonData['count'];

    int newestID = await db.tryNewest();
    RegExp exp = RegExp(r'^[a-zA-Z0-9_. -]*$');
    bool matches(String s) {
      return exp.hasMatch(s);
    }

    for (var result in results) {
      if (result['name'].length < 3) continue;
      final exercise = ListExercise()
        ..id = newestID + 1
        ..name = result['name'];

      if (!names.contains(exercise.name) && matches(exercise.name!)) {
        names.add(result['name']);
        ls.add(exercise);
        newestID += 1;
      }
    }

    db.receiveFromAPI(ls);
  }
}
