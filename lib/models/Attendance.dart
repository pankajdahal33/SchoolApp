// To parse this JSON data, do
//
//     final attendance = attendanceFromMap(jsonString);

import 'dart:convert';

class Attendance {
  Attendance({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory Attendance.fromJson(String str) =>
      Attendance.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attendance.fromMap(Map<String, dynamic> json) => Attendance(
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
    this.attendances,
    this.previousMonthDetails,
    this.days,
    this.year,
    this.month,
    this.currentDay,
    this.status,
  });

  List<AttendanceElement>? attendances;
  PreviousMonthDetails? previousMonthDetails;
  int? days;
  String? year;
  String? month;
  String? currentDay;
  String? status;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        attendances: json["attendances"] == null
            ? null
            : List<AttendanceElement>.from(
                json["attendances"].map((x) => AttendanceElement.fromMap(x))),
        previousMonthDetails: json["previousMonthDetails"] == null
            ? null
            : PreviousMonthDetails.fromMap(json["previousMonthDetails"]),
        days: json["days"] == null ? null : json["days"],
        year: json["year"] == null ? null : json["year"],
        month: json["month"] == null ? null : json["month"],
        currentDay: json["current_day"] == null ? null : json["current_day"],
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toMap() => {
        "attendances": attendances == null
            ? null
            : List<dynamic>.from(attendances!.map((x) => x.toMap())),
        "previousMonthDetails":
            previousMonthDetails == null ? null : previousMonthDetails!.toMap(),
        "days": days == null ? null : days,
        "year": year == null ? null : year,
        "month": month == null ? null : month,
        "current_day": currentDay == null ? null : currentDay,
        "status": status == null ? null : status,
      };
}

class AttendanceElement {
  AttendanceElement({
    this.attendanceType,
    this.attendanceDate,
  });

  String? attendanceType;
  DateTime? attendanceDate;

  // factory AttendanceElement.fromJson(String str) =>
  //     AttendanceElement.fromMap(json.decode(str));

  factory AttendanceElement.fromJson(Map<String, dynamic> json) {
    return AttendanceElement(
      attendanceType:
          json["attendance_type"] == null ? null : json["attendance_type"],
      attendanceDate: json["attendance_date"] == null
          ? null
          : DateTime.parse(json["attendance_date"]),
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceElement.fromMap(Map<String, dynamic> json) =>
      AttendanceElement(
        attendanceType:
            json["attendance_type"] == null ? null : json["attendance_type"],
        attendanceDate: json["attendance_date"] == null
            ? null
            : DateTime.parse(json["attendance_date"]),
      );

  Map<String, dynamic> toMap() => {
        "attendance_type": attendanceType == null ? null : attendanceType,
        "attendance_date": attendanceDate == null
            ? null
            : "${attendanceDate!.year.toString().padLeft(4, '0')}-${attendanceDate!.month.toString().padLeft(2, '0')}-${attendanceDate!.day.toString().padLeft(2, '0')}",
      };
}

class PreviousMonthDetails {
  PreviousMonthDetails({
    this.date,
    this.day,
    this.weekName,
  });

  String? date;
  int? day;
  String? weekName;

  factory PreviousMonthDetails.fromJson(String str) =>
      PreviousMonthDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory PreviousMonthDetails.fromMap(Map<String, dynamic> json) =>
      PreviousMonthDetails(
        date: json["date"] == null ? null : json["date"],
        day: json["day"] == null ? null : json["day"],
        weekName: json["week_name"] == null ? null : json["week_name"],
      );

  Map<String, dynamic> toMap() => {
        "date": date == null ? null : date,
        "day": day == null ? null : day,
        "week_name": weekName == null ? null : weekName,
      };
}

class StudentAttendanceList {
  List<AttendanceElement> attendances;

  StudentAttendanceList(this.attendances);

  factory StudentAttendanceList.fromJson(List<dynamic> json) {
    List<AttendanceElement> studentAttendanceList = [];

    studentAttendanceList =
        json.map((i) => AttendanceElement.fromJson(i)).toList();

    return StudentAttendanceList(studentAttendanceList);
  }
}
