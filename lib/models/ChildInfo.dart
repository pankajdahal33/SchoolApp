// To parse this JSON data, do
//
//     final childInfo = childInfoFromMap(jsonString);

import 'dart:convert';

import 'package:startupapplication/models/UserDetails.dart';

class ChildInfo {
  ChildInfo({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory ChildInfo.fromJson(String str) => ChildInfo.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChildInfo.fromMap(Map<String, dynamic> json) => ChildInfo(
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
    this.userDetails,
  });

  UserDetails? userDetails;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        userDetails: json["userDetails"] == null
            ? null
            : UserDetails.fromMap(json["userDetails"]),
      );

  Map<String, dynamic> toMap() => {
        "userDetails": userDetails == null ? null : userDetails!.toMap(),
      };
}
