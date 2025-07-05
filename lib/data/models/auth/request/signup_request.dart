import 'dart:convert';

class SignupRequest {
  final String? otp;
  final String? prefix;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? countryCode;
  final String? password;
  final bool? tcAccept;

  SignupRequest({
    this.otp,
    this.prefix,
    this.fullName,
    this.email,
    this.phone,
    this.countryCode,
    this.password,
    this.tcAccept,
  });

  SignupRequest copyWith({
    String? otp,
    String? prefix,
    String? fullName,
    String? email,
    String? phone,
    String? countryCode,
    String? password,
    bool? tcAccept,
  }) =>
      SignupRequest(
        otp: otp ?? this.otp,
        prefix: prefix ?? this.prefix,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
        password: password ?? this.password,
        tcAccept: tcAccept ?? this.tcAccept,
      );

  factory SignupRequest.fromJson(String str) =>
      SignupRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignupRequest.fromMap(Map<String, dynamic> json) => SignupRequest(
        otp: json["otp"],
        prefix: json["prefix"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        countryCode: json["countryCode"],
        password: json["password"],
        tcAccept: json["tcAccept"],
      );

  Map<String, dynamic> toMap() => {
        "otp": otp,
        "prefix": prefix,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "password": password,
        "tcAccept": tcAccept,
        "countryCode": countryCode,
      };
}
