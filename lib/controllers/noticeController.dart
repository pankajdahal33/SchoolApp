import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/models/Notice.dart';

class NoticeController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  UserController userController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  String? classId;

  var isLoading = false.obs;
  var teacherNoticeList = Notice();
  var studentNoticeList = Notice();

  getTeacherNoticeList() async {
    try {
      isLoading(true);
      await controller
          .getTeacherNoticeList(
        schoolId: getSharedContoller.schoolId,
        token: getSharedContoller.token,
      )
          .then((value) {
        if (value != null) {
          teacherNoticeList = value;
        }
      });
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  getStudentNoticeList() async {
    isLoading(true);
    try {
      var response = await controller.getStudentNoticeList(
        studentId: getSharedContoller.schoolId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        studentNoticeList = response;
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
