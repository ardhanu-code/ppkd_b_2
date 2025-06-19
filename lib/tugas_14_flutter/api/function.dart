import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/data_model.dart';

Future<List<Result>> fetchData() async {
  final response = await http.get(
    Uri.parse('https://rickandmortyapi.com/api/character'),
  );
  
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final welcome = Welcome.fromJson(data);
    return welcome.results;
  } else {
    throw Exception('Failed to load data. Error code: ${response.statusCode}');
  }
}
