import 'dart:convert';

class SocialSigninRequest {
  
  final String? socialId;
  final String? socialType;
  final String? email;
  final String? fullName;
  final String? prefix;
  final String? phone;
  final String? countryCode;

  SocialSigninRequest({
    this.socialId,
    this.socialType,
    this.email,
    this.fullName,
    this.prefix,
    this.phone,
    this.countryCode,
  });

  SocialSigninRequest copyWith({
    String? socialId,
    String? socialType,
    String? email,
    String? fullName,
    String? prefix,
    String? phone,
    String? countryCode,
  }) =>
      SocialSigninRequest(
        socialId: socialId ?? this.socialId,
        socialType: socialType ?? this.socialType,
        email: email ?? this.email,
        fullName: fullName ?? this.fullName,
        prefix: prefix ?? this.prefix,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
      );

  factory SocialSigninRequest.fromJson(String str) =>
      SocialSigninRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SocialSigninRequest.fromMap(Map<String, dynamic> json) =>
      SocialSigninRequest(
        socialId: json["socialId"],
        socialType: json["socialType"],
        email: json["email"],
        fullName: json["fullName"],
        prefix: json["prefix"],
        phone: json["phone"],
        countryCode: json["countryCode"],
      );

  Map<String, dynamic> toMap() => {
        "socialId": socialId,
        "socialType": socialType,
        "email": email,
        "fullName": fullName,
        "prefix": prefix,
        "phone": phone,
        "countryCode": countryCode,
      };
}
