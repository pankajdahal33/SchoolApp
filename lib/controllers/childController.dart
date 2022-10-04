import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/models/Childrens.dart';
import 'package:startupapplication/models/Login.dart';
import 'package:startupapplication/routes/app_pages.dart';

class ChildController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  UserController userController = Get.find();
  GetSharedContoller getSharedContoller = Get.put(GetSharedContoller());

  var isLoading = false.obs;
  var childList = Childrens();
  var childInfo = Login();

  @override
  void onInit() {
    getChildList();
    super.onInit();
  }

  getChildList() async {
    try {
      isLoading(true);
      var response = await controller.getChildList(
        parentId: getSharedContoller.userId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        childList = response;
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

  getChildInfo(String childId) async {
    try {
      isLoading(true);
      var response = await controller.getChildInfo(
        childId: getSharedContoller.childId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        childInfo = response;

        print('child info saved to shared pref');
        await Get.toNamed(Routes.STUDENTHOME);
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
