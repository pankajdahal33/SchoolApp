import 'package:get/get.dart';
import 'package:startupapplication/controllers/studentFeeController.dart';

class StudentFeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudentFeeController>(
      () => StudentFeeController(),
    );
  }
}
