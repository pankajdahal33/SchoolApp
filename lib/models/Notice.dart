// To parse this JSON data, do
//
//     final notice = noticeFromMap(jsonString);

import 'dart:convert';

class Notice {
  Notice({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory Notice.fromJson(String str) => Notice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Notice.fromMap(Map<String, dynamic> json) => Notice(
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
    this.allNotices,
  });

  List<AllNotice>? allNotices;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        allNotices: json["allNotices"] == null
            ? null
            : List<AllNotice>.from(
                json["allNotices"].map((x) => AllNotice.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "allNotices": allNotices == null
            ? null
            : List<dynamic>.from(allNotices!.map((x) => x.toMap())),
      };
}

class AllNotice {
  AllNotice({
    this.id,
    this.noticeTitle,
    this.noticeMessage,
    this.noticeDate,
    this.publishOn,
    this.informTo,
    this.activeStatus,
    this.isPublished,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.schoolId,
    this.academicId,
  });

  int? id;
  String? noticeTitle;
  String? noticeMessage;
  DateTime? noticeDate;
  DateTime? publishOn;
  String? informTo;
  String? activeStatus;
  String? isPublished;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? createdBy;
  String? updatedBy;
  String? schoolId;
  String? academicId;

  factory AllNotice.fromJson(String str) => AllNotice.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AllNotice.fromMap(Map<String, dynamic> json) => AllNotice(
        id: json["id"] == null ? null : json["id"],
        noticeTitle: json["notice_title"] == null ? null : json["notice_title"],
        noticeMessage:
            json["notice_message"] == null ? null : json["notice_message"],
        noticeDate: json["notice_date"] == null
            ? null
            : DateTime.parse(json["notice_date"]),
        publishOn: json["publish_on"] == null
            ? null
            : DateTime.parse(json["publish_on"]),
        informTo: json["inform_to"] == null ? null : json["inform_to"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        isPublished: json["is_published"] == null ? null : json["is_published"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        schoolId: json["school_id"] == null ? null : json["school_id"],
        academicId: json["academic_id"] == null ? null : json["academic_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "notice_title": noticeTitle == null ? null : noticeTitle,
        "notice_message": noticeMessage == null ? null : noticeMessage,
        "notice_date": noticeDate == null
            ? null
            : "${noticeDate!.year.toString().padLeft(4, '0')}-${noticeDate!.month.toString().padLeft(2, '0')}-${noticeDate!.day.toString().padLeft(2, '0')}",
        "publish_on": publishOn == null
            ? null
            : "${publishOn!.year.toString().padLeft(4, '0')}-${publishOn!.month.toString().padLeft(2, '0')}-${publishOn!.day.toString().padLeft(2, '0')}",
        "inform_to": informTo == null ? null : informTo,
        "active_status": activeStatus == null ? null : activeStatus,
        "is_published": isPublished == null ? null : isPublished,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "school_id": schoolId == null ? null : schoolId,
        "academic_id": academicId == null ? null : academicId,
      };
}
