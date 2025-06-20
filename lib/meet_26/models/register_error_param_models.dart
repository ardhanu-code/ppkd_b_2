// To parse this JSON data, do
//
//     final registerErrorParamsResponse = registerErrorParamsResponseFromJson(jsonString);

import 'dart:convert';

RegisterErrorParamsResponse registerErrorParamsResponseFromJson(String str) =>
    RegisterErrorParamsResponse.fromJson(json.decode(str));

String registerErrorParamsResponseToJson(RegisterErrorParamsResponse data) =>
    json.encode(data.toJson());

class RegisterErrorParamsResponse {
  String message;
  Errors errors;

  RegisterErrorParamsResponse({
    required this.message,
    required this.errors,
  });

  factory RegisterErrorParamsResponse.fromJson(Map<String, dynamic> json) =>
      RegisterErrorParamsResponse(
        message: json["message"],
        errors: Errors.fromJson(json["errors"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "errors": errors.toJson(),
      };
}

class Errors {
  List<String> name;
  List<String> email;
  List<String> password;

  Errors({
    required this.name,
    required this.email,
    required this.password,
  });

  factory Errors.fromJson(Map<String, dynamic> json) => Errors(
        name: List<String>.from(json["name"].map((x) => x)),
        email: List<String>.from(json["email"].map((x) => x)),
        password: List<String>.from(json["password"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": List<dynamic>.from(name.map((x) => x)),
        "email": List<dynamic>.from(email.map((x) => x)),
        "password": List<dynamic>.from(password.map((x) => x)),
      };
}
