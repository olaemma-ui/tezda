import 'dart:convert';

class VerifyOtpRequest {
    final String? otp;
    final String? email;

    VerifyOtpRequest({
        this.otp,
        this.email,
    });

    VerifyOtpRequest copyWith({
        String? otp,
        String? email,
    }) => 
        VerifyOtpRequest(
            otp: otp ?? this.otp,
            email: email ?? this.email,
        );

    factory VerifyOtpRequest.fromJson(String str) => VerifyOtpRequest.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory VerifyOtpRequest.fromMap(Map<String, dynamic> json) => VerifyOtpRequest(
        otp: json["otp"],
        email: json["email"],
    );

    Map<String, dynamic> toMap() => {
        "otp": otp,
        "email": email,
    };
}
