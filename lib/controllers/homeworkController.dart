import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/models/Homework.dart';

class HomeworkController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  GetSharedContoller getSharedContoller = Get.find();
  String? classId;

  var isLoading = false.obs;

  var studentHomeworkList = Homework();
  var teachertHomeworkList;

  getStudentHomeworkList() async {
    isLoading(true);
    try {
      var response = await controller.getStudentHomeworkList(
        studentId: 10.toString(), //student id or child id pathaune
        token: getSharedContoller.token,
      );
      if (response != null) {
        studentHomeworkList = response;
      }
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoading(false);
    }
  }

  getTeacherHomeworkList() {
    isLoading(true);
    try {
      var response = controller.getTeacherHomeworkList(
        teacherId: getSharedContoller.userId,
        token: getSharedContoller.token,
      );
      if (response != null) {
        teachertHomeworkList = response;
      }
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoading(false);
    }
  }
}
