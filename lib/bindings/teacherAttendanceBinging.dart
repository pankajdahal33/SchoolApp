import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/classController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';

class TeacherAttendanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AttendanceController>(
      () => AttendanceController(),
    );

    Get.lazyPut<GetSharedContoller>(
      () => GetSharedContoller(),
    );
    Get.lazyPut<ClassController>(
      () => ClassController(),
    );
  }
}
