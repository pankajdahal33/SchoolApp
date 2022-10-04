import 'package:get/get.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    //  Get.lazyPut<TokenContoller>(
    //   () => TokenContoller(),
    // );
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<GetSharedContoller>(
      () => GetSharedContoller(),
    );
  }
}
