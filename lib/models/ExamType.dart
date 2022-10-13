// To parse this JSON data, do
//
//     final examType = examTypeFromMap(jsonString);

import 'dart:convert';

class ExamTypeList {
  ExamTypeList({
    this.examTypes,
    this.studentDetail,
  });

  List<ExamTypeElement>? examTypes;
  StudentDetail? studentDetail;

  factory ExamTypeList.fromJson(String str) =>
      ExamTypeList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamTypeList.fromMap(Map<String, dynamic> json) => ExamTypeList(
        examTypes: json["exam_types"] == null
            ? null
            : List<ExamTypeElement>.from(
                json["exam_types"].map((x) => ExamTypeElement.fromMap(x))),
        studentDetail: json["student_detail"] == null
            ? null
            : StudentDetail.fromMap(json["student_detail"]),
      );

  Map<String, dynamic> toMap() => {
        "exam_types": examTypes == null
            ? null
            : List<dynamic>.from(examTypes!.map((x) => x.toMap())),
        "student_detail": studentDetail == null ? null : studentDetail!.toMap(),
      };
}

class ExamTypeElement {
  ExamTypeElement({
    this.id,
    this.title,
  });

  dynamic id;
  String? title;

  factory ExamTypeElement.fromJson(String str) =>
      ExamTypeElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamTypeElement.fromMap(Map<String, dynamic> json) => ExamTypeElement(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}

class StudentDetail {
  StudentDetail({
    this.id,
    this.fullName,
    this.classId,
    this.sectionId,
    this.userId,
  });

  dynamic id;
  String? fullName;
  String? classId;
  String? sectionId;
  String? userId;

  factory StudentDetail.fromJson(String str) =>
      StudentDetail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StudentDetail.fromMap(Map<String, dynamic> json) => StudentDetail(
        id: json["id"] == null ? null : json["id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        classId: json["class_id"] == null ? null : json["class_id"],
        sectionId: json["section_id"] == null ? null : json["section_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "full_name": fullName == null ? null : fullName,
        "class_id": classId == null ? null : classId,
        "section_id": sectionId == null ? null : sectionId,
        "user_id": userId == null ? null : userId,
      };
}
