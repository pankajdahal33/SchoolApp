import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/models/Class.dart';
import 'package:startupapplication/models/ClassStudent.dart';
import 'package:startupapplication/models/Section.dart';
import 'package:startupapplication/models/TeacherSubject.dart';

class ClassController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  UserController userController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  String? classId;

  var isLoadingClass = false.obs;
  var isLoadingSection = false.obs;
  var isLoadingSubject = false.obs;
  var isLoading = false.obs;
  var classList = <ClassList>[];
  var classSectionList = Section();
  var classStudentList = ClassStudent();
  var classTeacherSubjectList = TeacherSubject();

  getClassList() async {
    try {
      isLoadingClass(true);
      var response = await controller.getClassList(
        teacherId: getSharedContoller.userId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        classList = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoadingClass(false);
    }
  }

  getTeacherClassSection() async {
    try {
      isLoadingSection(true);
      var response = await controller.getTeacherClassSection(
        teacherId: getSharedContoller.userId,
        classId: getSharedContoller.teacherClassId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        classSectionList = response;
        Utils.saveStringValue('teacherClassSectionId',
            classSectionList.data!.teacherSections!.first.sectionId!);
        await getSharedContoller.sharedPreferenceData();
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoadingSection(false);
    }
  }

  getClassStudents() async {
    try {
      isLoading(true);
      var response = await controller.getClassStudents(
        classId: getSharedContoller.teacherClassId,
        sectionId: getSharedContoller.teacherClassSectionId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        classStudentList = response;
      }
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoading(false);
    }
  }

  getTeacherAllSubject() async {
    try {
      isLoadingSubject(true);
      var response = await controller.getTeacherAllSubject(
        teacherId: getSharedContoller.userId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        classTeacherSubjectList = response;
      }
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoadingSubject(false);
    }
  }
}
