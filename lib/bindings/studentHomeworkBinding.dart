import 'package:get/get.dart';
import 'package:startupapplication/controllers/homeworkController.dart';

class StudentHomeworkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeworkController>(
      () => HomeworkController(),
    );
  }
}
