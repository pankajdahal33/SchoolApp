// To parse this JSON data, do
//
//     final teacherSubject = teacherSubjectFromMap(jsonString);

import 'dart:convert';

class TeacherSubject {
  TeacherSubject({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory TeacherSubject.fromJson(String str) =>
      TeacherSubject.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeacherSubject.fromMap(Map<String, dynamic> json) => TeacherSubject(
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
    this.subjectsName,
    this.subjectType,
  });

  List<SubjectsName>? subjectsName;
  String? subjectType;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        subjectsName: json["subjectsName"] == null
            ? null
            : List<SubjectsName>.from(
                json["subjectsName"].map((x) => SubjectsName.fromMap(x))),
        subjectType: json["subject_type"] == null ? null : json["subject_type"],
      );

  Map<String, dynamic> toMap() => {
        "subjectsName": subjectsName == null
            ? null
            : List<dynamic>.from(subjectsName!.map((x) => x.toMap())),
        "subject_type": subjectType == null ? null : subjectType,
      };
}

class SubjectsName {
  SubjectsName({
    this.subjectId,
    this.subjectName,
    this.subjectCode,
    this.subjectType,
  });

  String? subjectId;
  String? subjectName;
  String? subjectCode;
  String? subjectType;

  factory SubjectsName.fromJson(String str) =>
      SubjectsName.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubjectsName.fromMap(Map<String, dynamic> json) => SubjectsName(
        subjectId: json["subject_id"] == null ? null : json["subject_id"],
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        subjectCode: json["subject_code"] == null ? null : json["subject_code"],
        subjectType: json["subject_type"] == null ? null : json["subject_type"],
      );

  Map<String, dynamic> toMap() => {
        "subject_id": subjectId == null ? null : subjectId,
        "subject_name": subjectName == null ? null : subjectName,
        "subject_code": subjectCode == null ? null : subjectCode,
        "subject_type": subjectType == null ? null : subjectType,
      };
}
