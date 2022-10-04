import 'dart:convert';

class User {
  User({
    this.id,
    this.fullName,
    this.username,
    this.email,
    this.usertype,
    this.activeStatus,
    this.randomCode,
    this.notificationToken,
    this.createdAt,
    this.updatedAt,
    this.language,
    this.styleId,
    this.rtlLtl,
    this.selectedSession,
    this.createdBy,
    this.updatedBy,
    this.accessStatus,
    this.schoolId,
    this.roleId,
    this.isAdministrator,
    this.isRegistered,
    this.deviceToken,
    this.stripeId,
    this.cardBrand,
    this.cardLastFour,
    this.verified,
    this.trialEndsAt,
    this.walletBalance,
    this.firstName,
    this.avatarUrl,
    this.blockedByMe,
  });

  int? id;
  String? fullName;
  String? username;
  String? email;
  dynamic usertype;
  String? activeStatus;
  dynamic randomCode;
  dynamic notificationToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? language;
  String? styleId;
  String? rtlLtl;
  String? selectedSession;
  String? createdBy;
  String? updatedBy;
  String? accessStatus;
  String? schoolId;
  String? roleId;
  String? isAdministrator;
  String? isRegistered;
  dynamic deviceToken;
  dynamic stripeId;
  dynamic cardBrand;
  dynamic cardLastFour;
  dynamic verified;
  dynamic trialEndsAt;
  String? walletBalance;
  String? firstName;
  String? avatarUrl;
  bool? blockedByMe;

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"] == null ? null : json["id"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        username: json["username"] == null ? null : json["username"],
        email: json["email"] == null ? null : json["email"],
        usertype: json["usertype"],
        activeStatus:
            json["active_status"] == null ? null : json["active_status"],
        randomCode: json["random_code"],
        notificationToken: json["notificationToken"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        language: json["language"] == null ? null : json["language"],
        styleId: json["style_id"] == null ? null : json["style_id"],
        rtlLtl: json["rtl_ltl"] == null ? null : json["rtl_ltl"],
        selectedSession:
            json["selected_session"] == null ? null : json["selected_session"],
        createdBy: json["created_by"] == null ? null : json["created_by"],
        updatedBy: json["updated_by"] == null ? null : json["updated_by"],
        accessStatus:
            json["access_status"] == null ? null : json["access_status"],
        schoolId: json["school_id"] == null ? null : json["school_id"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        isAdministrator:
            json["is_administrator"] == null ? null : json["is_administrator"],
        isRegistered:
            json["is_registered"] == null ? null : json["is_registered"],
        deviceToken: json["device_token"],
        stripeId: json["stripe_id"],
        cardBrand: json["card_brand"],
        cardLastFour: json["card_last_four"],
        verified: json["verified"],
        trialEndsAt: json["trial_ends_at"],
        walletBalance:
            json["wallet_balance"] == null ? null : json["wallet_balance"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        avatarUrl: json["avatar_url"] == null ? null : json["avatar_url"],
        blockedByMe:
            json["blocked_by_me"] == null ? null : json["blocked_by_me"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "full_name": fullName == null ? null : fullName,
        "username": username == null ? null : username,
        "email": email == null ? null : email,
        "usertype": usertype,
        "active_status": activeStatus == null ? null : activeStatus,
        "random_code": randomCode,
        "notificationToken": notificationToken,
        "created_at": createdAt == null ? null : createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
        "language": language == null ? null : language,
        "style_id": styleId == null ? null : styleId,
        "rtl_ltl": rtlLtl == null ? null : rtlLtl,
        "selected_session": selectedSession == null ? null : selectedSession,
        "created_by": createdBy == null ? null : createdBy,
        "updated_by": updatedBy == null ? null : updatedBy,
        "access_status": accessStatus == null ? null : accessStatus,
        "school_id": schoolId == null ? null : schoolId,
        "role_id": roleId == null ? null : roleId,
        "is_administrator": isAdministrator == null ? null : isAdministrator,
        "is_registered": isRegistered == null ? null : isRegistered,
        "device_token": deviceToken,
        "stripe_id": stripeId,
        "card_brand": cardBrand,
        "card_last_four": cardLastFour,
        "verified": verified,
        "trial_ends_at": trialEndsAt,
        "wallet_balance": walletBalance == null ? null : walletBalance,
        "first_name": firstName == null ? null : firstName,
        "avatar_url": avatarUrl == null ? null : avatarUrl,
        "blocked_by_me": blockedByMe == null ? null : blockedByMe,
      };
}
