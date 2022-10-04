import 'package:get/get.dart';
import 'package:startupapplication/helpers/Utils.dart';

class GetSharedContoller extends GetxController {
  int? rtlValue;
  String? token;
  String? email;
  String? password;
  String? rule;
  String? userId;
  String? schoolId;
  String? isAdministrator;
  String? fullName;
  String? roleId;
  String? className;
  String? rollNo;
  String? sectionName;
  String? dateOfBirth;
  String? age;
  String? currentAddress;
  String? permanentAddress;
  String? isLoggedIn;
  String? mobile;
  String? fatherName;
  String? fatherPhone;
  String? motherName;
  String? motherPhone;
  String? guardianName;
  String? guardianPhone;
  String? bloodGroup;
  String? religion;
  String? childId;
  String? childName;
  String? childClass;
  String? childSection;
  String? childAge;
  String? childDOB;
  String? childAddress;
  String? childBloodGroup;
  String? childReligion;
  String? childRollNo;
  String? teacherClassId;
  String? teacherClassSectionId;
  String? attendanceStudentId;

  var isLoading = true.obs;
  @override
  void onInit() {
    sharedPreferenceData();
    super.onInit();
  }

  Future<void> sharedPreferenceData() async {
    isLoading(true);
    Utils.getStringValue('token').then((value) {
      token = value;
    });
    Utils.getStringValue('userId').then((value) {
      userId = value;
    });
    Utils.getStringValue('email').then((value) {
      email = value;
    });
    Utils.getStringValue('fullName').then((value) {
      fullName = value;
    });
    Utils.getStringValue('password').then((value) {
      password = value;
    });
    Utils.getStringValue('schoolId').then((value) {
      schoolId = value;
    });
    Utils.getStringValue('roleId').then((value) {
      roleId = value;
    });
    Utils.getStringValue('className').then((value) {
      className = value;
    });
    Utils.getStringValue('rollNo').then((value) {
      rollNo = value;
    });
    Utils.getStringValue('sectionName').then((value) {
      sectionName = value;
    });
    Utils.getStringValue('dateOfBirth').then((value) {
      dateOfBirth = value;
    });
    Utils.getStringValue('age').then((value) {
      age = value;
    });
    Utils.getStringValue('currentAddress').then((value) {
      currentAddress = value;
    });
    Utils.getStringValue('permanentAddress').then((value) {
      permanentAddress = value;
    });
    Utils.getStringValue('isLoggedIn').then((value) {
      isLoggedIn = value;
    });
    Utils.getStringValue('mobile').then((value) {
      mobile = value;
    });
    Utils.getStringValue('fatherName').then((value) {
      fatherName = value;
    });
    Utils.getStringValue('fatherPhone').then((value) {
      fatherPhone = value;
    });
    Utils.getStringValue('motherName').then((value) {
      motherName = value;
    });
    Utils.getStringValue('motherPhone').then((value) {
      motherPhone = value;
    });
    Utils.getStringValue('guardianName').then((value) {
      guardianName = value;
    });
    Utils.getStringValue('guardianPhone').then((value) {
      guardianPhone = value;
    });
    Utils.getStringValue('bloodGroup').then((value) {
      bloodGroup = value;
    });
    Utils.getStringValue('religion').then((value) {
      religion = value;
    });
    Utils.getStringValue('childId').then((value) {
      childId = value;
    });
    Utils.getStringValue('childName').then((value) {
      childName = value;
    });
    Utils.getStringValue('childClass').then((value) {
      childClass = value;
    });
    Utils.getStringValue('childSection').then((value) {
      childSection = value;
    });
    Utils.getStringValue('childAge').then((value) {
      childAge = value;
    });
    Utils.getStringValue('childDOB').then((value) {
      childDOB = value;
    });
    Utils.getStringValue('childAddress').then((value) {
      childAddress = value;
    });
    Utils.getStringValue('childBloodGroup').then((value) {
      childBloodGroup = value;
    });
    Utils.getStringValue('childReligion').then((value) {
      childReligion = value;
    });
    Utils.getStringValue('childRollNo').then((value) {
      childRollNo = value;
    });

    Utils.getStringValue('teacherClassId').then((value) {
      teacherClassId = value;
    });
    Utils.getStringValue('teacherClassSectionId').then((value) {
      teacherClassSectionId = value;
    });
    Utils.getStringValue('attendanceStudentId').then((value) {
      attendanceStudentId = value;
    });

    isLoading(false);
  }
}
