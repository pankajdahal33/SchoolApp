// To parse this JSON data, do
//
//     final homework = homeworkFromMap(jsonString);

import 'dart:convert';

class Homework {
  Homework({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<Datum>? data;
  dynamic message;

  factory Homework.fromJson(String str) => Homework.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Homework.fromMap(Map<String, dynamic> json) => Homework(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toMap())),
        "message": message,
      };
}

class Datum {
  Datum({
    this.id,
    this.homeworkDate,
    this.submissionDate,
    this.createdBy,
    this.className,
    this.sectionName,
    this.subjectName,
    this.marks,
    this.file,
    this.description,
    this.obtainedMarks,
    this.status,
  });

  dynamic id;
  DateTime? homeworkDate;
  DateTime? submissionDate;
  String? createdBy;
  String? className;
  String? sectionName;
  String? subjectName;
  String? marks;
  String? file;
  String? description;
  String? obtainedMarks;
  String? status;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        homeworkDate: json["homework_date"] == null
            ? null
            : DateTime.parse(json["homework_date"]),
        submissionDate: json["submission_date"] == null
            ? null
            : DateTime.parse(json["submission_date"]),
        createdBy: json["created_by"] == null ? null : json["created_by"],
        className: json["class_name"] == null ? null : json["class_name"],
        sectionName: json["section_name"] == null ? null : json["section_name"],
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        marks: json["marks"] == null ? null : json["marks"],
        file: json["file"] == null ? null : json["file"],
        description: json["description"] == null ? null : json["description"],
        obtainedMarks:
            json["obtained_marks"] == null ? "N/A" : json["obtained_marks"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "homework_date": homeworkDate == null
            ? null
            : "${homeworkDate!.year.toString().padLeft(4, '0')}-${homeworkDate!.month.toString().padLeft(2, '0')}-${homeworkDate!.day.toString().padLeft(2, '0')}",
        "submission_date": submissionDate == null
            ? null
            : "${submissionDate!.year.toString().padLeft(4, '0')}-${submissionDate!.month.toString().padLeft(2, '0')}-${submissionDate!.day.toString().padLeft(2, '0')}",
        "created_by": createdBy == null ? null : createdBy,
        "class_name": className == null ? null : className,
        "section_name": sectionName == null ? null : sectionName,
        "subject_name": subjectName == null ? null : subjectName,
        "marks": marks == null ? null : marks,
        "file": file == null ? null : file,
        "description": description == null ? null : description,
        "obtained_marks": obtainedMarks == null ? null : obtainedMarks,
        "status": status == null ? null : status,
      };
}
