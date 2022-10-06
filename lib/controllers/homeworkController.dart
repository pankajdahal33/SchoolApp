import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/models/Homework.dart';

class HomeworkController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  GetSharedContoller getSharedContoller = Get.find();
  String? classId;

  var isLoading = false.obs;

  var studentHomeworkList = Homework();

  getStudentHomeworkList() async {
    isLoading(true);
    try {
      var response = await controller.getStudentHomeworkList(
        studentId: 10.toString(), //student id or child id pathaune
        token: getSharedContoller.token,
      );
      if (response != null) {
        studentHomeworkList = response;
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
