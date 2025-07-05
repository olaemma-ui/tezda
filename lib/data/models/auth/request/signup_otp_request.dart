import 'dart:convert';

class OtpRequest {
  final String? email;
  final String? type;
  final String? phone;

  OtpRequest({
    this.email,
    this.type,
    this.phone,
  });

  OtpRequest copyWith({
    String? email,
    String? type,
    String? phone,
  }) =>
      OtpRequest(
        email: email ?? this.email,
        type: type ?? this.type,
        phone: phone ?? this.phone,
      );

  factory OtpRequest.fromJson(String str) =>
      OtpRequest.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory OtpRequest.fromMap(Map<String, dynamic> json) =>
      OtpRequest(
        email: json["email"],
        type: json["type"],
        phone: json["phone"],
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "type": type,
        "phone": phone,
      };
}
