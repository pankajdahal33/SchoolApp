import 'package:get/get.dart';
import 'package:startupapplication/controllers/studentExamController.dart';

class StudentExamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentExamController>(
      () => StudentExamController(),
    );
  }
}
