// To parse this JSON data, do
//
//     final examResult = examResultFromMap(jsonString);

import 'dart:convert';

class ExamResult {
  ExamResult({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory ExamResult.fromJson(String str) =>
      ExamResult.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamResult.fromMap(Map<String, dynamic> json) => ExamResult(
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
    this.examResult,
    this.passMarks,
  });

  List<ExamResultElement>? examResult;
  dynamic passMarks;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        examResult: json["exam_result"] == null
            ? null
            : List<ExamResultElement>.from(
                json["exam_result"].map((x) => ExamResultElement.fromMap(x))),
        passMarks: json["pass_marks"] == null ? null : json["pass_marks"],
      );

  Map<String, dynamic> toMap() => {
        "exam_result": examResult == null
            ? null
            : List<dynamic>.from(examResult!.map((x) => x.toMap())),
        "pass_marks": passMarks == null ? null : passMarks,
      };
}

class ExamResultElement {
  ExamResultElement({
    this.id,
    this.examName,
    this.subjectName,
    this.obtainedMarks,
    this.totalMarks,
    this.grade,
  });

  String? id;
  String? examName;
  String? subjectName;
  String? obtainedMarks;
  String? totalMarks;
  String? grade;

  factory ExamResultElement.fromJson(String str) =>
      ExamResultElement.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamResultElement.fromMap(Map<String, dynamic> json) =>
      ExamResultElement(
        id: json["id"] == null ? null : json["id"],
        examName: json["exam_name"] == null ? null : json["exam_name"],
        subjectName: json["subject_name"] == null ? null : json["subject_name"],
        obtainedMarks:
            json["obtained_marks"] == null ? null : json["obtained_marks"],
        totalMarks: json["total_marks"] == null ? null : json["total_marks"],
        grade: json["grade"] == null ? null : json["grade"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "exam_name": examName == null ? null : examName,
        "subject_name": subjectName == null ? null : subjectName,
        "obtained_marks": obtainedMarks == null ? null : obtainedMarks,
        "total_marks": totalMarks == null ? null : totalMarks,
        "grade": grade == null ? null : grade,
      };
}
