import 'dart:convert';

class UserDetails {
  UserDetails({
    this.id,
    this.admissionNo,
    this.rollNo,
    this.firstName,
    this.lastName,
    this.fullName,
    this.dateOfBirth,
    this.email,
    this.mobile,
    this.admissionDate,
    this.studentPhoto,
    this.age,
    this.currentAddress,
    this.permanentAddress,
    this.driverId,
    this.nationalIdNo,
    this.localIdNo,
    this.bankAccountNo,
    this.bankName,
    this.bloodgroupId,
    this.religionId,
    this.routeListId,
    this.dormitoryId,
    this.vechileId,
    this.roomId,
    this.studentCategoryId,
    this.studentGroupId,
    this.classId,
    this.sectionId,
    this.sessionId,
    this.parentId,
    this.userId,
    this.roleId,
    this.genderId,
    this.schoolId,
    this.academicId,
    this.fathersName,
    this.fathersMobile,
    this.mothersName,
    this.mothersMobile,
    this.guardiansName,
    this.guardiansMobile,
    this.className,
    this.sectionName,
  });

  dynamic id;
  String? admissionNo;
  String? rollNo;
  String? firstName;
  String? lastName;
  String? fullName;
  DateTime? dateOfBirth;
  String? email;
  String? mobile;
  DateTime? admissionDate;
  String? studentPhoto;
  dynamic age;
  String? currentAddress;
  dynamic permanentAddress;
  dynamic driverId;
  String? nationalIdNo;
  dynamic localIdNo;
  dynamic bankAccountNo;
  dynamic bankName;
  String? bloodgroupId;
  String? religionId;
  dynamic routeListId;
  dynamic dormitoryId;
  dynamic vechileId;
  dynamic roomId;
  dynamic studentCategoryId;
  dynamic studentGroupId;
  String? classId;
  String? sectionId;
  String? sessionId;
  String? parentId;
  String? userId;
  String? roleId;
  String? genderId;
  String? schoolId;
  String? academicId;
  String? fathersName;
  String? fathersMobile;
  String? mothersName;
  String? mothersMobile;
  String? guardiansName;
  String? guardiansMobile;
  String? className;
  String? sectionName;

  factory UserDetails.fromJson(String str) =>
      UserDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
        id: json["id"] == null ? null : json["id"],
        admissionNo: json["admission_no"] == null ? null : json["admission_no"],
        rollNo: json["roll_no"] == null ? null : json["roll_no"],
        firstName: json["first_name"] == null ? null : json["first_name"],
        lastName: json["last_name"] == null ? null : json["last_name"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        dateOfBirth: json["date_of_birth"] == null
            ? null
            : DateTime.parse(json["date_of_birth"]),
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        admissionDate: json["admission_date"] == null
            ? null
            : DateTime.parse(json["admission_date"]),
        studentPhoto:
            json["student_photo"] == null ? null : json["student_photo"],
        age: json["age"],
        currentAddress:
            json["current_address"] == null ? null : json["current_address"],
        permanentAddress: json["permanent_address"],
        driverId: json["driver_id"],
        nationalIdNo:
            json["national_id_no"] == null ? null : json["national_id_no"],
        localIdNo: json["local_id_no"],
        bankAccountNo: json["bank_account_no"],
        bankName: json["bank_name"],
        bloodgroupId:
            json["bloodgroup_id"] == null ? null : json["bloodgroup_id"],
        religionId: json["religion_id"] == null ? null : json["religion_id"],
        routeListId: json["route_list_id"],
        dormitoryId: json["dormitory_id"],
        vechileId: json["vechile_id"],
        roomId: json["room_id"],
        studentCategoryId: json["student_category_id"],
        studentGroupId: json["student_group_id"],
        classId: json["class_id"] == null ? null : json["class_id"],
        sectionId: json["section_id"] == null ? null : json["section_id"],
        sessionId: json["session_id"] == null ? null : json["session_id"],
        parentId: json["parent_id"] == null ? null : json["parent_id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        roleId: json["role_id"] == null ? null : json["role_id"],
        genderId: json["gender_id"] == null ? null : json["gender_id"],
        schoolId: json["school_id"] == null ? null : json["school_id"],
        academicId: json["academic_id"] == null ? null : json["academic_id"],
        fathersName: json["fathers_name"] == null ? null : json["fathers_name"],
        fathersMobile:
            json["fathers_mobile"] == null ? null : json["fathers_mobile"],
        mothersName: json["mothers_name"] == null ? null : json["mothers_name"],
        mothersMobile:
            json["mothers_mobile"] == null ? null : json["mothers_mobile"],
        guardiansName:
            json["guardians_name"] == null ? null : json["guardians_name"],
        guardiansMobile:
            json["guardians_mobile"] == null ? null : json["guardians_mobile"],
        className: json["class_name"] == null ? null : json["class_name"],
        sectionName: json["section_name"] == null ? null : json["section_name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "admission_no": admissionNo == null ? null : admissionNo,
        "roll_no": rollNo == null ? null : rollNo,
        "first_name": firstName == null ? null : firstName,
        "last_name": lastName == null ? null : lastName,
        "full_name": fullName == null ? null : fullName,
        "date_of_birth": dateOfBirth == null
            ? null
            : "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "admission_date": admissionDate == null
            ? null
            : "${admissionDate!.year.toString().padLeft(4, '0')}-${admissionDate!.month.toString().padLeft(2, '0')}-${admissionDate!.day.toString().padLeft(2, '0')}",
        "student_photo": studentPhoto == null ? null : studentPhoto,
        "age": age,
        "current_address": currentAddress == null ? null : currentAddress,
        "permanent_address": permanentAddress,
        "driver_id": driverId,
        "national_id_no": nationalIdNo == null ? null : nationalIdNo,
        "local_id_no": localIdNo,
        "bank_account_no": bankAccountNo,
        "bank_name": bankName,
        "bloodgroup_id": bloodgroupId == null ? null : bloodgroupId,
        "religion_id": religionId == null ? null : religionId,
        "route_list_id": routeListId,
        "dormitory_id": dormitoryId,
        "vechile_id": vechileId,
        "room_id": roomId,
        "student_category_id": studentCategoryId,
        "student_group_id": studentGroupId,
        "class_id": classId == null ? null : classId,
        "section_id": sectionId == null ? null : sectionId,
        "session_id": sessionId == null ? null : sessionId,
        "parent_id": parentId == null ? null : parentId,
        "user_id": userId == null ? null : userId,
        "role_id": roleId == null ? null : roleId,
        "gender_id": genderId == null ? null : genderId,
        "school_id": schoolId == null ? null : schoolId,
        "academic_id": academicId == null ? null : academicId,
        "fathers_name": fathersName == null ? null : fathersName,
        "fathers_mobile": fathersMobile == null ? null : fathersMobile,
        "mothers_name": mothersName == null ? null : mothersName,
        "mothers_mobile": mothersMobile == null ? null : mothersMobile,
        "guardians_name": guardiansName == null ? null : guardiansName,
        "guardians_mobile": guardiansMobile == null ? null : guardiansMobile,
        "class_name": className == null ? null : className,
        "section_name": sectionName == null ? null : sectionName,
      };
}
