// To parse this JSON data, do
//
//     final childrens = childrensFromMap(jsonString);

import 'dart:convert';

class Childrens {
  Childrens({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  List<Datum>? data;
  dynamic message;

  factory Childrens.fromJson(String str) => Childrens.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Childrens.fromMap(Map<String, dynamic> json) => Childrens(
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
    this.userId,
    this.studentPhoto,
    this.studentName,
    this.className,
    this.sectionName,
    this.rollNo,
  });

  dynamic userId;
  String? studentPhoto;
  String? studentName;
  String? className;
  String? sectionName;
  String? rollNo;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        userId: json["user_id"] == null ? null : json["user_id"],
        studentPhoto:
            json["student_photo"] == null ? null : json["student_photo"],
        studentName: json["student_name"] == null ? null : json["student_name"],
        className: json["class_name"] == null ? null : json["class_name"],
        sectionName: json["section_name"] == null ? null : json["section_name"],
        rollNo: json["roll_no"] == null ? null : json["roll_no"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId == null ? null : userId,
        "student_photo": studentPhoto == null ? null : studentPhoto,
        "student_name": studentName == null ? null : studentName,
        "class_name": className == null ? null : className,
        "section_name": sectionName == null ? null : sectionName,
        "roll_no": rollNo == null ? null : rollNo,
      };
}
