import 'dart:convert';

class LoginRequest {
  final String? username;
  final String? password;

  LoginRequest({
    this.username,
    this.password,
  });

  LoginRequest copyWith({
    String? username,
    String? password,
  }) =>
      LoginRequest(
        username: username ?? this.username,
        password: password ?? this.password,
      );

  factory LoginRequest.fromJson(String str) =>
      LoginRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginRequest.fromMap(Map<String, dynamic> json) => LoginRequest(
        username: json["username"],
        password: json["password"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "password": password,
      };
}
