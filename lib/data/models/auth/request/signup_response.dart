import 'dart:convert';

class SignupResponse {
  final User? user;
  final String? accessToken;
  final String? refreshToken;

  SignupResponse({
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  SignupResponse copyWith({
    User? user,
    String? accessToken,
    String? refreshToken,
  }) =>
      SignupResponse(
        user: user ?? this.user,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
      );

  factory SignupResponse.fromJson(String str) =>
      SignupResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SignupResponse.fromMap(Map<String, dynamic> json) => SignupResponse(
        user: json["user"] == null ? null : User.fromMap(json["user"]),
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toMap() => {
        "user": user?.toMap(),
        "accessToken": accessToken,
        "refreshToken": refreshToken,
      };
}

class User {
  final dynamic prefix;
  final String? fullName;
  final String? email;
  final dynamic phone;
  final dynamic countryCode;
  final String? password;
  final bool? tcAccept;
  final bool? isActive;
  final String? role;
  final dynamic firstname;
  final dynamic lastname;
  final dynamic profilePhoto;
  final dynamic ip;
  final dynamic status;
  final dynamic dob;
  final dynamic country;
  final dynamic language;
  final dynamic state;
  final dynamic currency;
  final dynamic avatar;
  final dynamic lastLogin;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic socialType;
  final dynamic socialId;
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  User({
    this.prefix,
    this.fullName,
    this.email,
    this.phone,
    this.countryCode,
    this.password,
    this.tcAccept,
    this.isActive,
    this.role,
    this.firstname,
    this.lastname,
    this.profilePhoto,
    this.ip,
    this.status,
    this.dob,
    this.country,
    this.language,
    this.state,
    this.currency,
    this.avatar,
    this.lastLogin,
    this.latitude,
    this.longitude,
    this.socialType,
    this.socialId,
    this.id,
    this.createdAt,
    this.updatedAt,
  });

  User copyWith({
    dynamic prefix,
    String? fullName,
    String? email,
    dynamic phone,
    dynamic countryCode,
    String? password,
    bool? tcAccept,
    bool? isActive,
    String? role,
    dynamic firstname,
    dynamic lastname,
    dynamic profilePhoto,
    dynamic ip,
    dynamic status,
    dynamic dob,
    dynamic country,
    dynamic language,
    dynamic state,
    dynamic currency,
    dynamic avatar,
    dynamic lastLogin,
    dynamic latitude,
    dynamic longitude,
    dynamic socialType,
    dynamic socialId,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      User(
        prefix: prefix ?? this.prefix,
        fullName: fullName ?? this.fullName,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        countryCode: countryCode ?? this.countryCode,
        password: password ?? this.password,
        tcAccept: tcAccept ?? this.tcAccept,
        isActive: isActive ?? this.isActive,
        role: role ?? this.role,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        profilePhoto: profilePhoto ?? this.profilePhoto,
        ip: ip ?? this.ip,
        status: status ?? this.status,
        dob: dob ?? this.dob,
        country: country ?? this.country,
        language: language ?? this.language,
        state: state ?? this.state,
        currency: currency ?? this.currency,
        avatar: avatar ?? this.avatar,
        lastLogin: lastLogin ?? this.lastLogin,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        socialType: socialType ?? this.socialType,
        socialId: socialId ?? this.socialId,
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        prefix: json["prefix"],
        fullName: json["fullName"],
        email: json["email"],
        phone: json["phone"],
        countryCode: json["countryCode"],
        password: json["password"],
        tcAccept: json["tcAccept"],
        isActive: json["isActive"],
        role: json["role"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        profilePhoto: json["profilePhoto"],
        ip: json["ip"],
        status: json["status"],
        dob: json["dob"],
        country: json["country"],
        language: json["language"],
        state: json["state"],
        currency: json["currency"],
        avatar: json["avatar"],
        lastLogin: json["lastLogin"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        socialType: json["socialType"],
        socialId: json["socialId"],
        id: json["id"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "prefix": prefix,
        "fullName": fullName,
        "email": email,
        "phone": phone,
        "countryCode": countryCode,
        "password": password,
        "tcAccept": tcAccept,
        "isActive": isActive,
        "role": role,
        "firstname": firstname,
        "lastname": lastname,
        "profilePhoto": profilePhoto,
        "ip": ip,
        "status": status,
        "dob": dob,
        "country": country,
        "language": language,
        "state": state,
        "currency": currency,
        "avatar": avatar,
        "lastLogin": lastLogin,
        "latitude": latitude,
        "longitude": longitude,
        "socialType": socialType,
        "socialId": socialId,
        "id": id,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
