import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/models/Class.dart';
import 'package:startupapplication/models/ClassStudent.dart';
import 'package:startupapplication/models/Section.dart';

class ClassController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  UserController userController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  String? classId;

  var isLoadingClass = false.obs;
  var isLoadingSection = false.obs;
  var isLoading = false.obs;
  var classList = Class();
  var classSectionList = Section();
  var classStudentList = ClassStudent();

  getClassList() async {
    try {
      isLoadingClass(true);
      var response = await controller.getClassList(
        teacherId: getSharedContoller.userId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        classList = response;
        await getTeacherClassSection(
            classList.data!.teacherClasses![0].classId!);
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

  getTeacherClassSection(classId) async {
    try {
      isLoadingSection(true);
      var response = await controller.getTeacherClassSection(
        teacherId: getSharedContoller.userId,
        classId: classId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        classSectionList = response;
        Utils.saveStringValue('teacherClassSectionId',
            classSectionList.data!.teacherSections![0].sectionId!);
        await getSharedContoller.sharedPreferenceData();
        await getClassStudents();
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
        classId: 1.toString(),
        sectionId: 1.toString(),
        token: getSharedContoller.token,
      );
      if (response != null) {
        classStudentList = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }
}
