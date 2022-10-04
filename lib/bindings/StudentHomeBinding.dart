import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';

class StudentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );
    Get.lazyPut<GetSharedContoller>(
      () => GetSharedContoller(),
    );
  }
}
