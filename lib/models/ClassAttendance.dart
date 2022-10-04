// To parse this JSON data, do
//
//     final classAttendance = classAttendanceFromMap(jsonString);

import 'dart:convert';

class ClassAttendance {
  ClassAttendance({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<Datum>? data;
  dynamic message;

  factory ClassAttendance.fromJson(String str) =>
      ClassAttendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClassAttendance.fromMap(Map<String, dynamic> json) => ClassAttendance(
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
    this.studentId,
    this.studentPhoto,
    this.fullName,
    this.rollNo,
    this.className,
    this.sectionName,
    this.attendanceType,
    this.userId,
  });

  int? id;
  dynamic studentId;
  String? studentPhoto;
  String? fullName;
  String? rollNo;
  String? className;
  String? sectionName;
  String? attendanceType;
  String? userId;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        studentId: json["student_id"] == null ? null : json["student_id"],
        studentPhoto:
            json["student_photo"] == null ? null : json["student_photo"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        rollNo: json["roll_no"] == null ? null : json["roll_no"],
        className: json["class_name"] == null ? null : json["class_name"],
        sectionName: json["section_name"] == null ? null : json["section_name"],
        attendanceType:
            json["attendance_type"] == null ? null : json["attendance_type"],
        userId: json["user_id"] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "student_id": studentId == null ? null : studentId,
        "student_photo": studentPhoto == null ? null : studentPhoto,
        "full_name": fullName == null ? null : fullName,
        "roll_no": rollNo == null ? null : rollNo,
        "class_name": className == null ? null : className,
        "section_name": sectionName == null ? null : sectionName,
        "attendance_type": attendanceType == null ? null : attendanceType,
        "user_id": userId == null ? null : userId,
      };
}
