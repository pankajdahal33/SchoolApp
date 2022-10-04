import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';

class AttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );

    Get.lazyPut<GetSharedContoller>(
      () => GetSharedContoller(),
    );
  }
}
