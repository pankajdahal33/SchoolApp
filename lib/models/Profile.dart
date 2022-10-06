// To parse this JSON data, do
//
//     final profile = profileFromMap(jsonString);

import 'dart:convert';

import 'package:startupapplication/models/UserDetails.dart';

class Profile {
  Profile({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory Profile.fromJson(String str) => Profile.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Profile.fromMap(Map<String, dynamic> json) => Profile(
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
