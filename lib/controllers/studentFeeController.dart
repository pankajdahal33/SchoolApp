import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/models/Fee.dart';

class StudentFeeController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  GetSharedContoller getSharedContoller = Get.find();
  String? classId;

  var isLoading = false.obs;

  var studentFeeList = Fee();

  getStudentFeeList() async {
    isLoading(true);
    try {
      var response = await controller.getStudentFeeList(
        studentId: 10.toString(),
        token: getSharedContoller.token,
      );
      if (response != null) {
        studentFeeList = response;
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
