// To parse this JSON data, do
//
//     final login = loginFromMap(jsonString);

import 'dart:convert';

class Login {
  Login({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory Login.fromJson(String str) => Login.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data!.toMap(),
        "message": message == null ? null : message,
      };
}

class Data {
  Data({
    this.roleId,
    this.userId,
    this.accessToken,
  });

  String? roleId;
  int? userId;
  String? accessToken;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        roleId: json["role_id"] == null ? null : json["role_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        accessToken: json["accessToken"] == null ? null : json["accessToken"],
      );

  Map<String, dynamic> toMap() => {
        "role_id": roleId == null ? null : roleId,
        "user_id": userId == null ? null : userId,
        "accessToken": accessToken == null ? null : accessToken,
      };
}
