// To parse this JSON data, do
//
//     final classStudent = classStudentFromMap(jsonString);

import 'dart:convert';

class ClassStudent {
  ClassStudent({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  String? message;

  factory ClassStudent.fromJson(String str) =>
      ClassStudent.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClassStudent.fromMap(Map<String, dynamic> json) => ClassStudent(
        success: json["success"] == null ? null : json["success"],
        data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"] == null ? null : json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success == null ? null : success,
        "data": data == null ? null : data!.toMap(),
        "message": message == null ? null : message,
      };
}

class Data {
  Data({
    this.students,
  });

  List<Student>? students;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        students: json["students"] == null
            ? null
            : List<Student>.from(
                json["students"].map((x) => Student.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "students": students == null
            ? null
            : List<dynamic>.from(students!.map((x) => x.toMap())),
      };
}

class Student {
  Student({
    this.id,
    this.studentPhoto,
    this.fullName,
    this.rollNo,
    this.className,
    this.sectionName,
    this.userId,
  });

  String? id;
  String? studentPhoto;
  String? fullName;
  String? rollNo;
  String? className;
  String? sectionName;
  String? userId;

  factory Student.fromJson(String str) => Student.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Student.fromMap(Map<String, dynamic> json) => Student(
        id: json["id"] == null ? null : json["id"],
        studentPhoto:
            json["student_photo"] == null ? null : json["student_photo"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        rollNo: json["roll_no"] == null ? null : json["roll_no"],
        className: json["class_name"] == null ? null : json["class_name"],
        sectionName: json["section_name"] == null ? null : json["section_name"],
        userId: json["user_id"] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "student_photo": studentPhoto == null ? null : studentPhoto,
        "full_name": fullName == null ? null : fullName,
        "roll_no": rollNo == null ? null : rollNo,
        "class_name": className == null ? null : className,
        "section_name": sectionName == null ? null : sectionName,
        "user_id": userId == null ? null : userId,
      };
}
