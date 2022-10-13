// To parse this JSON data, do
//
//     final examSchdeule = examSchdeuleFromMap(jsonString);

import 'dart:convert';

class ExamSchdeule {
  ExamSchdeule({
    this.examType,
    this.examRoutines,
  });

  ExamType? examType;
  ExamRoutines? examRoutines;

  factory ExamSchdeule.fromJson(String str) =>
      ExamSchdeule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamSchdeule.fromMap(Map<String, dynamic> json) => ExamSchdeule(
        examType: json["examType"] == null
            ? null
            : ExamType.fromMap(json["examType"]),
        examRoutines: json["exam_routines"] == null
            ? null
            : ExamRoutines.fromMap(json["exam_routines"]),
      );

  Map<String, dynamic> toMap() => {
        "examType": examType == null ? null : examType!.toMap(),
        "exam_routines": examRoutines == null ? null : examRoutines!.toMap(),
      };
}

class ExamRoutines {
  ExamRoutines({
    this.the20220916,
  });

  List<The20220916>? the20220916;

  factory ExamRoutines.fromJson(String str) =>
      ExamRoutines.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamRoutines.fromMap(Map<String, dynamic> json) => ExamRoutines(
        the20220916: json["2022-09-16"] == null
            ? null
            : List<The20220916>.from(
                json["2022-09-16"].map((x) => The20220916.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "2022-09-16": the20220916 == null
            ? null
            : List<dynamic>.from(the20220916!.map((x) => x.toMap())),
      };
}

class The20220916 {
  The20220916({
    this.id,
    this.date,
    this.the20220916Class,
    this.section,
    this.room,
    this.subject,
    this.teacher,
    this.examType,
    this.startTime,
    this.endTime,
  });

  dynamic id;
  DateTime? date;
  String? the20220916Class;
  String? section;
  String? room;
  String? subject;
  String? teacher;
  String? examType;
  String? startTime;
  String? endTime;

  factory The20220916.fromJson(String str) =>
      The20220916.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory The20220916.fromMap(Map<String, dynamic> json) => The20220916(
        id: json["id"] == null ? null : json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        the20220916Class: json["class"] == null ? null : json["class"],
        section: json["section"] == null ? null : json["section"],
        room: json["room"] == null ? null : json["room"],
        subject: json["subject"] == null ? null : json["subject"],
        teacher: json["teacher"] == null ? null : json["teacher"],
        examType: json["exam_type"] == null ? null : json["exam_type"],
        startTime: json["start_time"] == null ? null : json["start_time"],
        endTime: json["end_time"] == null ? null : json["end_time"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "class": the20220916Class == null ? null : the20220916Class,
        "section": section == null ? null : section,
        "room": room == null ? null : room,
        "subject": subject == null ? null : subject,
        "teacher": teacher == null ? null : teacher,
        "exam_type": examType == null ? null : examType,
        "start_time": startTime == null ? null : startTime,
        "end_time": endTime == null ? null : endTime,
      };
}

class ExamType {
  ExamType({
    this.id,
    this.title,
  });

  dynamic id;
  String? title;

  factory ExamType.fromJson(String str) => ExamType.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ExamType.fromMap(Map<String, dynamic> json) => ExamType(
        id: json["id"] == null ? null : json["id"],
        title: json["title"] == null ? null : json["title"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "title": title == null ? null : title,
      };
}
