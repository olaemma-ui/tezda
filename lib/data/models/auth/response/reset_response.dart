import 'dart:convert';

class ResetPasswordRespObj {
  final String? email;

  ResetPasswordRespObj({
    this.email,
  });

  ResetPasswordRespObj copyWith({
    String? email,
  }) =>
      ResetPasswordRespObj(
        email: email ?? this.email,
      );

  factory ResetPasswordRespObj.fromJson(String str) =>
      ResetPasswordRespObj.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResetPasswordRespObj.fromMap(Map<String, dynamic> json) =>
      ResetPasswordRespObj(
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
      };
}
