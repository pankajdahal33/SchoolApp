import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/models/Notification.dart';

class NotificationController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  UserController userController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  String? classId;

  var isLoading = false.obs;
  var myNotificationList = MyNotification();

  getMyNotification() async {
    try {
      isLoading(true);
      await controller
          .getMyNotification(
        userId: getSharedContoller.userId,
        token: getSharedContoller.token,
      )
          .then((value) {
        if (value != null) {
          myNotificationList = value;
        }
      });
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoading(false);
    }
  }

  markAsReadNotification(String notificationId) async {
    try {
      isLoading(true);
      var response = controller.markAsReadNotification(
        userId: getSharedContoller.userId,
        notificationId: notificationId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        await getMyNotification();
        Utils.showToast('Notification Marked as Read');
      }
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoading(false);
    }
  }

  markReadAllNotification() {
    try {
      isLoading(true);
      var response = controller.markReadAllNotification(
        userId: getSharedContoller.userId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        getMyNotification();
        Utils.showToast('All Notification Marked as Read');
      }
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
