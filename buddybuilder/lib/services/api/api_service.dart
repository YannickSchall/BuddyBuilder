import 'dart:convert';
import 'package:isar/isar.dart';
import 'package:buddybuilder/services/db/book.dart';
import 'package:http/http.dart' as http;

class APIService {
  late Stream<int> newestIdStream;

  APIService();

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
}
