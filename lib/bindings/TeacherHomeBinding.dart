import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';

class TeacherHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserController>(
      () => UserController(),
    );
    Get.lazyPut<GetSharedContoller>(
      () => GetSharedContoller(),
    );
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );
  }
}
