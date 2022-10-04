// To parse this JSON data, do
//
//     final section = sectionFromMap(jsonString);

import 'dart:convert';

class Section {
  Section({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory Section.fromJson(String str) => Section.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Section.fromMap(Map<String, dynamic> json) => Section(
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
    this.teacherSections,
  });

  List<TeacherSection>? teacherSections;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        teacherSections: json["teacher_sections"] == null
            ? null
            : List<TeacherSection>.from(
                json["teacher_sections"].map((x) => TeacherSection.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "teacher_sections": teacherSections == null
            ? null
            : List<dynamic>.from(teacherSections!.map((x) => x.toMap())),
      };
}

class TeacherSection {
  TeacherSection({
    this.sectionId,
    this.sectionName,
  });

  String? sectionId;
  String? sectionName;

  factory TeacherSection.fromJson(String str) =>
      TeacherSection.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TeacherSection.fromMap(Map<String, dynamic> json) => TeacherSection(
        sectionId: json["section_id"] == null ? null : json["section_id"],
        sectionName: json["section_name"] == null ? null : json["section_name"],
      );

  Map<String, dynamic> toMap() => {
        "section_id": sectionId == null ? null : sectionId,
        "section_name": sectionName == null ? null : sectionName,
      };
}
