import 'dart:convert';

class UserDetails {
  UserDetails({
    this.id,
    this.admissionNo,
    this.rollNo,
    this.fullName,
    this.dateOfBirth,
    this.age,
    this.email,
    this.mobile,
    this.className,
    this.sectionName,
    this.admissionDate,
    this.currentAddress,
    this.permanentAddress,
    this.fathersName,
    this.fathersMobile,
    this.mothersName,
    this.mothersMobile,
    this.guardiansName,
    this.guardiansMobile,
    this.guardiansEmail,
    this.guardiansRelation,
  });

  dynamic id;
  dynamic admissionNo;
  dynamic rollNo;
  dynamic fullName;
  dynamic dateOfBirth;
  dynamic age;
  dynamic email;
  dynamic mobile;
  dynamic className;
  dynamic sectionName;
  dynamic admissionDate;
  dynamic currentAddress;
  dynamic permanentAddress;
  dynamic fathersName;
  dynamic fathersMobile;
  dynamic mothersName;
  dynamic mothersMobile;
  dynamic guardiansName;
  dynamic guardiansMobile;
  dynamic guardiansEmail;
  dynamic guardiansRelation;

  factory UserDetails.fromJson(String str) =>
      UserDetails.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserDetails.fromMap(Map<String, dynamic> json) => UserDetails(
        id: json["id"] == null ? null : json["id"],
        admissionNo: json["admission_no"] == null ? null : json["admission_no"],
        rollNo: json["roll_no"] == null ? null : json["roll_no"],
        fullName: json["full_name"] == null ? null : json["full_name"],
        dateOfBirth:
            json["date_of_birth"] == null ? null : json["date_of_birth"],
        age: json["age"] == null ? null : json["age"],
        email: json["email"] == null ? null : json["email"],
        mobile: json["mobile"] == null ? null : json["mobile"],
        className: json["class_name"] == null ? null : json["class_name"],
        sectionName: json["section_name"] == null ? null : json["section_name"],
        admissionDate:
            json["admission_date"] == null ? null : json["admission_date"],
        currentAddress:
            json["current_address"] == null ? null : json["current_address"],
        permanentAddress: json["permanent_address"] == null
            ? null
            : json["permanent_address"],
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
        guardiansEmail:
            json["guardians_email"] == null ? null : json["guardians_email"],
        guardiansRelation: json["guardians_relation"] == null
            ? null
            : json["guardians_relation"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "admission_no": admissionNo == null ? null : admissionNo,
        "roll_no": rollNo == null ? null : rollNo,
        "full_name": fullName == null ? null : fullName,
        "date_of_birth": dateOfBirth == null ? null : dateOfBirth,
        "age": age == null ? null : age,
        "email": email == null ? null : email,
        "mobile": mobile == null ? null : mobile,
        "class_name": className == null ? null : className,
        "section_name": sectionName == null ? null : sectionName,
        "admission_date": admissionDate == null ? null : admissionDate,
        "current_address": currentAddress == null ? null : currentAddress,
        "permanent_address": permanentAddress == null ? null : permanentAddress,
        "fathers_name": fathersName == null ? null : fathersName,
        "fathers_mobile": fathersMobile == null ? null : fathersMobile,
        "mothers_name": mothersName == null ? null : mothersName,
        "mothers_mobile": mothersMobile == null ? null : mothersMobile,
        "guardians_name": guardiansName == null ? null : guardiansName,
        "guardians_mobile": guardiansMobile == null ? null : guardiansMobile,
        "guardians_email": guardiansEmail == null ? null : guardiansEmail,
        "guardians_relation":
            guardiansRelation == null ? null : guardiansRelation,
      };
}
