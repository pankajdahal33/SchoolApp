import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/models/ExamResult.dart';
import 'package:startupapplication/models/ExamSchedule.dart';
import 'package:startupapplication/models/ExamType.dart';

class StudentExamController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  UserController userController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();

  var isLoading = false.obs;
  var isLoadingSchdeule = false.obs;
  var examScheduleTypeList = ExamTypeList();
  var examSchedule = ExamSchdeule();
  var examResult = ExamResult();

  getStudentExamTypeList() async {
    isLoading(true);
    try {
      await controller
          .getStudentExamTypeList(
        studentId: getSharedContoller.roleId == "3"
            ? getSharedContoller.childId
            : getSharedContoller.userId,
        token: getSharedContoller.token,
      )
          .then((value) {
        if (value != null) {
          examScheduleTypeList = value;
        }
      });
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoading(false);
    }
  }

  getExamScheduleById(examId) async {
    isLoadingSchdeule(true);
    try {
      await controller
          .getExamScheduleById(
        examId: examId,
        token: getSharedContoller.token,
      )
          .then((value) {
        if (value != null) {
          examSchedule = value;
        }
      });
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoadingSchdeule(false);
    }
  }

  getExamResultById(examId) async {
    isLoadingSchdeule(true);
    try {
      await controller
          .getExamResultById(
        studentId: getSharedContoller.roleId == "3"
            ? getSharedContoller.childId
            : getSharedContoller.userId,
        examId: examId,
        token: getSharedContoller.token,
      )
          .then((value) {
        if (value != null) {
          examResult = value;
        }
      });
    } catch (e) {
      Utils.showToast(e.toString());
    } finally {
      isLoadingSchdeule(false);
    }
  }
}
