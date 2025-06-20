import 'package:http/http.dart' as http;
import 'package:ppkd_b_2/meet_26/api/preferences.dart';
import 'package:ppkd_b_2/meet_26/endpoint/endpoint.dart';
import 'package:ppkd_b_2/meet_26/models/register_error_param_models.dart';
import 'package:ppkd_b_2/meet_26/models/register_models.dart';
import 'package:ppkd_b_2/meet_26/models/user_response.dart';

class UserService {
  Future<Map<String, dynamic>> registerUser(
      String name, String email, String password) async {
    final response = await http.post(Uri.parse(Endpoint.registUrl),
        headers: {"Accept": "application/json"},
        body: {"name": name, "email": email, "password": password});
    if (response.statusCode == 200) {
      return registerResponseFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return registerErrorParamsResponseFromJson(response.body).toJson();
    } else {
      throw Exception(
          'Gagal mendaftarkan akun. Error code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final response = await http.post(Uri.parse(Endpoint.loginUrl),
        headers: {"Accept": "application/json"},
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      return registerResponseFromJson(response.body).toJson();
    } else if (response.statusCode == 422) {
      return registerErrorParamsResponseFromJson(response.body).toJson();
    } else {
      throw Exception(
          'Gagal mendaftarkan akun. Error code: ${response.statusCode}');
    }
  }

  Future<Map<String, dynamic>> getProfile() async {
    String? token = await PreferencesHelper.getToken();
    print(token);
    final response = await http.get(
      Uri.parse(Endpoint.profileUrl),
      headers: {
        "Accept": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      print('masuk kesini');
      return userResponseFromJson(response.body).toJson();
    } else {
      throw Exception(
          'Gagal mengambil data profil. Error code: ${response.statusCode}');
    }
  }
}
