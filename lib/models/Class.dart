// To parse this JSON data, do
//
//     final class = classFromMap(jsonString);

import 'dart:convert';

class Class {
  Class({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory Class.fromJson(String str) => Class.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Class.fromMap(Map<String, dynamic> json) => Class(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data!.toMap(),
        "message": message,
      };
}

class Data {
  Data({
    this.teacherClasses,
  });

  List<TeacherClass>? teacherClasses;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        teacherClasses: json["teacher_classes"] == null
            ? null
            : List<TeacherClass>.from(
                json["teacher_classes"].map((x) => TeacherClass.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "teacher_classes": teacherClasses == null
            ? null
            : List<dynamic>.from(teacherClasses!.map((x) => x.toMap())),
      };
}

class TeacherClass {
  TeacherClass({
    this.classId,
    this.className,
  });

  String? classId;
  String? className;

  factory TeacherClass.fromJson(String str) =>
      TeacherClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeacherClass.fromMap(Map<String, dynamic> json) => TeacherClass(
        classId: json["class_id"] == null ? null : json["class_id"],
        className: json["class_name"] == null ? null : json["class_name"],
      );

  Map<String, dynamic> toMap() => {
        "class_id": classId == null ? null : classId,
        "class_name": className == null ? null : className,
      };
}
