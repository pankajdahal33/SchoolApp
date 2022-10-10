// To parse this JSON data, do
//
//     final classList = classListFromMap(jsonString);

import 'dart:convert';

class ClassList {
  ClassList({
    this.classId,
    this.className,
  });

  String? classId;
  String? className;

  factory ClassList.fromJson(String str) => ClassList.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ClassList.fromMap(Map<String, dynamic> json) => ClassList(
        classId: json["class_id"] == null ? null : json["class_id"],
        className: json["class_name"] == null ? null : json["class_name"],
      );

  Map<String, dynamic> toMap() => {
        "class_id": classId == null ? null : classId,
        "class_name": className == null ? null : className,
      };
}
