import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/data_model.dart';

Future<List<Data>> fetchData() async {
  final response = await http.get(
    Uri.parse('https://ghibliapi.vercel.app/films'),
  );

  if (response.statusCode == 200) {
    final List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Data.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load data. Error code: ${response.statusCode}');
  }
}
