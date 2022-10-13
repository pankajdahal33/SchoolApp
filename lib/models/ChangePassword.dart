// To parse this JSON data, do
//
//     final changePassword = changePasswordFromMap(jsonString);

import 'dart:convert';

class ChangePassword {
  ChangePassword({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  dynamic data;
  String? message;

  factory ChangePassword.fromJson(String str) =>
      ChangePassword.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChangePassword.fromMap(Map<String, dynamic> json) => ChangePassword(
        success: json["success"] == null ? null : json["success"],
        data: json["data"],
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data,
        "message": message == null ? null : message,
      };
}
