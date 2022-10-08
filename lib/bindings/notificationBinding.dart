import 'package:get/get.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/notificationController.dart';

class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetSharedContoller>(
      () => GetSharedContoller(),
    );
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
  }
}
