// To parse this JSON data, do
//
//     final teacherClass = teacherClassFromMap(jsonString);

import 'dart:convert';

class TeacherClass {
  TeacherClass({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory TeacherClass.fromJson(String str) =>
      TeacherClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeacherClass.fromMap(Map<String, dynamic> json) => TeacherClass(
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

  List<TeacherClassElement>? teacherClasses;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        teacherClasses: json["teacher_classes"] == null
            ? null
            : List<TeacherClassElement>.from(json["teacher_classes"]
                .map((x) => TeacherClassElement.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "teacher_classes": teacherClasses == null
            ? null
            : List<dynamic>.from(teacherClasses!.map((x) => x.toMap())),
      };
}

class TeacherClassElement {
  TeacherClassElement({
    this.classId,
    this.className,
    this.sectionId,
    this.sectionName,
  });

  String? classId;
  String? className;
  String? sectionId;
  String? sectionName;

  factory TeacherClassElement.fromJson(String str) =>
      TeacherClassElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeacherClassElement.fromMap(Map<String, dynamic> json) =>
      TeacherClassElement(
        classId: json["class_id"] == null ? null : json["class_id"],
        className: json["class_name"] == null ? null : json["class_name"],
        sectionId: json["section_id"] == null ? null : json["section_id"],
        sectionName: json["section_name"] == null ? null : json["section_name"],
      );

  Map<String, dynamic> toMap() => {
        "class_id": classId == null ? null : classId,
        "class_name": className == null ? null : className,
        "section_id": sectionId == null ? null : sectionId,
        "section_name": sectionName == null ? null : sectionName,
      };
}
