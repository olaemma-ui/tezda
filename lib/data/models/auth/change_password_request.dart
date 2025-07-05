import 'dart:convert';

class ChangePasswordRequest {
  final String? email;
  final String? password;
  final String? passwordConfirm;

  ChangePasswordRequest({
    this.email,
    this.password,
    this.passwordConfirm,
  });

  ChangePasswordRequest copyWith({
    String? email,
    String? password,
    String? passwordConfirm,
  }) =>
      ChangePasswordRequest(
        email: email ?? this.email,
        password: password ?? this.password,
        passwordConfirm: passwordConfirm ?? this.passwordConfirm,
      );

  factory ChangePasswordRequest.fromJson(String str) =>
      ChangePasswordRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChangePasswordRequest.fromMap(Map<String, dynamic> json) =>
      ChangePasswordRequest(
        email: json["email"],
        password: json["password"],
        passwordConfirm: json["password_confirm"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "password": password,
        "password_confirm": passwordConfirm,
      };
}
