import 'dart:convert';

class ResetPasswordRequest {
    final String? currentPassword;
    final String? newPassword;
    final String? confirmNewPassword;

    ResetPasswordRequest({
        this.currentPassword,
        this.newPassword,
        this.confirmNewPassword,
    });

    ResetPasswordRequest copyWith({
        String? currentPassword,
        String? newPassword,
        String? confirmNewPassword,
    }) => 
        ResetPasswordRequest(
            currentPassword: currentPassword ?? this.currentPassword,
            newPassword: newPassword ?? this.newPassword,
            confirmNewPassword: confirmNewPassword ?? this.confirmNewPassword,
        );

    factory ResetPasswordRequest.fromJson(String str) => ResetPasswordRequest.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ResetPasswordRequest.fromMap(Map<String, dynamic> json) => ResetPasswordRequest(
        currentPassword: json["currentPassword"],
        newPassword: json["newPassword"],
        confirmNewPassword: json["confirmNewPassword"],
    );

    Map<String, dynamic> toMap() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
        "confirmNewPassword": confirmNewPassword,
    };
}
