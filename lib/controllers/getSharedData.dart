import 'package:get/get.dart';
import 'package:startupapplication/helpers/Utils.dart';

class GetSharedContoller extends GetxController {
  String? isLoggedIn;
  String? token;
  String? userId;
  String? roleId;
  String? email;
  String? password;
  String? childId;
  String? schoolId;

  var isLoading = true.obs;
  @override
  void onInit() {
    sharedPreferenceData();
    super.onInit();
  }

  Future<void> sharedPreferenceData() async {
    isLoading(true);
    Utils.getStringValue('isLoggedIn').then((value) {
      isLoggedIn = value;
    });
    Utils.getStringValue('token').then((value) {
      token = value;
    });
    Utils.getStringValue('userId').then((value) {
      userId = value;
    });
    Utils.getStringValue('roleId').then((value) {
      roleId = value;
    });
    Utils.getStringValue('email').then((value) {
      email = value;
    });
    Utils.getStringValue('password').then((value) {
      password = value;
    });
    Utils.getStringValue('childId').then((value) {
      childId = value;
    });
    Utils.getStringValue('schoolId').then((value) {
      schoolId = value;
    });

    isLoading(false);
  }
}
