import 'package:get/get.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/noticeController.dart';

class StudentNoticeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetSharedContoller>(
      () => GetSharedContoller(),
    );
    Get.lazyPut<NoticeController>(
      () => NoticeController(),
    );
  }
}
