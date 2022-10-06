import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/models/Login.dart';
import 'package:startupapplication/models/Profile.dart';
import 'package:startupapplication/routes/app_pages.dart';

class UserController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  GetSharedContoller getSharedContoller = Get.find();
  String? email;
  String? password;
  String? schoolId;

  var isLoading = false.obs;
  var loginData = Login();
  var profileData = Profile();

  //getProfile
  login() async {
    try {
      isLoading(true);
      var response = await controller.login(
        email: email,
        password: password,
      );

      if (response != null) {
        loginData = response;

        Utils.saveStringValue('isLoggedIn', 'true');
        Utils.saveStringValue('token', loginData.data!.accessToken.toString());
        Utils.saveStringValue('userId', loginData.data!.userId!.toString());
        Utils.saveStringValue('roleId', loginData.data!.roleId!.toString());
        Utils.saveStringValue('email', email!);
        Utils.saveStringValue('password', password!);

        await getSharedContoller.sharedPreferenceData();
        print(
          " email=" +
              getSharedContoller.email! +
              " password=" +
              getSharedContoller.password! +
              " userId=" +
              getSharedContoller.userId! +
              " token=" +
              getSharedContoller.token! +
              " roleID=" +
              getSharedContoller.roleId!,
        );
        //getProfile();
        //Sucess snackbar
        if (loginData.success! == true) {
          Get.snackbar("Success", loginData.message!,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.green,
              colorText: Colors.white);
          if (loginData.data!.roleId == "1" ||
              loginData.data!.roleId == "4" ||
              loginData.data!.roleId == "5") {
            Get.toNamed(Routes.TEACHERHOME);
          } else if (loginData.data!.roleId == "2") {
            Get.toNamed(Routes.STUDENTHOME);
          } else if (loginData.data!.roleId == "3") {
            Get.toNamed(Routes.SELECTCHILD);
          }
        } else {
          Get.snackbar("Error", loginData.message!,
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
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

  logout() async {
    Utils.clearAllValue();
    Get.offAllNamed(Routes.LOGIN);
  }

  //getProfile
  getProfile() async {
    try {
      isLoading(true);
      var response = await controller.getProfile(
        email: getSharedContoller.email,
        password: getSharedContoller.password,
        token: getSharedContoller.token,
      );

      if (response != null) {
        profileData = response;
        Utils.saveStringValue(
            'schoolId', profileData.data!.userDetails!.schoolId!.toString());
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
