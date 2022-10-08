// To parse this JSON data, do
//
//     final notifiacation = notifiacationFromMap(jsonString);

import 'dart:convert';

class MyNotification {
  MyNotification({
    this.success,
    this.data,
    this.message,
  });

  bool? success;
  Data? data;
  dynamic message;

  factory MyNotification.fromJson(String str) =>
      MyNotification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MyNotification.fromMap(Map<String, dynamic> json) => MyNotification(
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
    this.unreadNotification,
    this.notifications,
  });

  int? unreadNotification;
  List<Notification>? notifications;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        unreadNotification: json["unread_notification"] == null
            ? null
            : json["unread_notification"],
        notifications: json["notifications"] == null
            ? null
            : List<Notification>.from(
                json["notifications"].map((x) => Notification.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "unread_notification":
            unreadNotification == null ? null : unreadNotification,
        "notifications": notifications == null
            ? null
            : List<dynamic>.from(notifications!.map((x) => x.toMap())),
      };
}

class Notification {
  Notification({
    this.id,
    this.date,
    this.message,
    this.url,
    this.createdAt,
    this.isRead,
  });

  dynamic id;
  DateTime? date;
  String? message;
  String? url;
  DateTime? createdAt;
  String? isRead;

  factory Notification.fromJson(String str) =>
      Notification.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Notification.fromMap(Map<String, dynamic> json) => Notification(
        id: json["id"] == null ? null : json["id"],
        date: json["date"] == null ? null : DateTime.parse(json["date"]),
        message: json["message"] == null ? null : json["message"],
        url: json["url"] == null ? null : json["url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        isRead: json["is_read"] == null ? null : json["is_read"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "date": date == null
            ? null
            : "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "message": message == null ? null : message,
        "url": url == null ? null : url,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "is_read": isRead == null ? null : isRead,
      };
}
