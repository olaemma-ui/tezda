import 'dart:convert';

class CheckEmailAndPhoneResponse {
    final bool? emailExists;
    final bool? phoneExists;

    CheckEmailAndPhoneResponse({
        this.emailExists,
        this.phoneExists,
    });

    CheckEmailAndPhoneResponse copyWith({
        bool? emailExists,
        bool? phoneExists,
    }) => 
        CheckEmailAndPhoneResponse(
            emailExists: emailExists ?? this.emailExists,
            phoneExists: phoneExists ?? this.phoneExists,
        );

    factory CheckEmailAndPhoneResponse.fromJson(String str) => CheckEmailAndPhoneResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CheckEmailAndPhoneResponse.fromMap(Map<String, dynamic> json) => CheckEmailAndPhoneResponse(
        emailExists: json["emailExists"],
        phoneExists: json["phoneExists"],
    );

    Map<String, dynamic> toMap() => {
        "emailExists": emailExists,
        "phoneExists": phoneExists,
    };
}
