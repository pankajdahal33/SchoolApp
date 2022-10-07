import 'package:get/get.dart';
import 'package:startupapplication/controllers/fileUp_DownlaodController.dart';
import 'package:startupapplication/controllers/homeworkController.dart';

class StudentHomeworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeworkController>(
      () => HomeworkController(),
    );
    Get.lazyPut<UpDownlaodController>(
      () => UpDownlaodController(),
    );
  }
}
