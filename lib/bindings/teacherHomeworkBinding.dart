import 'package:get/get.dart';
import 'package:startupapplication/controllers/classController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/homeworkController.dart';

class TeacherHomeworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetSharedContoller>(
      () => GetSharedContoller(),
    );
    Get.lazyPut<HomeworkController>(
      () => HomeworkController(),
    );
    Get.lazyPut<ClassController>(
      () => ClassController(),
    );
  }
}
