import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/models/Attendance.dart';
import 'package:startupapplication/models/ClassAttendance.dart';
import 'package:startupapplication/routes/app_pages.dart';

class AttendanceController extends GetxController {
  ApiRequestController controller = ApiRequestController();
  UserController userController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();

  String? studentId;
  String? date;
  int absentCount = 0;
  int presentCount = 0;
  int totalStudent = 0;

  var isLoading = false.obs;
  var studentAttendanceData = Attendance();
  var classAttendanceList = ClassAttendance();
  var attendanceDone = false.obs;

  getStudentAttendance(DateTime? date) async {
    try {
      isLoading(true);
      var response = await controller.getstudentAttendance(
        studentId: getSharedContoller.userId,
        month: date!.month.toString(),
        year: date.year.toString(),
        token: getSharedContoller.token,
      );
      if (response != null) {
        studentAttendanceData = response;
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  String getAttendanceStatus(int date, List<AttendanceElement> attendances) {
    return getStatus(0, attendances.length - 1, attendances, date);
  }

  String getStatus(
      int i, int j, List<AttendanceElement> attendances, int date) {
    String? status;
    for (int a = i; a <= j; a++) {
      if (int.parse(attendances[a].attendanceDate!.day.toString()) == date) {
        status = attendances[a].attendanceType!;
        print(status);
      }
    }
    return status ?? '';
  }

  String getStatusCount(String titleVal, List<AttendanceElement> attendances) {
    int count = 0;
    for (int i = 0; i < attendances.length; i++) {
      if (attendances[i].attendanceType == titleVal) {
        count = count + 1;
      }
    }
    return '$count ' + "days".tr;
  }

  attendanceCheck(attendanceDate) async {
    try {
      isLoading(true);
      var response = await controller.attendanceCheck(
        classId: 1.toString(),
        sectionId: 1.toString(),
        date: attendanceDate,
        token: getSharedContoller.token,
      );
      if (response != null) {
        classAttendanceList = response;

        //count total students
        totalStudent = classAttendanceList.data!.length;

        //count present students
        for (int i = 0; i < classAttendanceList.data!.length; i++) {
          if (classAttendanceList.data![i].attendanceType == "P") {
            presentCount = presentCount + 1;
          }
        }

        for (int i = 0; i < classAttendanceList.data!.length; i++) {
          if (classAttendanceList.data![i].attendanceType == "A") {
            absentCount = absentCount + 1;
          }
        }
        print(absentCount);

        Get.toNamed(Routes.CHECKCLASSATTENDANCE);
        if (classAttendanceList.message == "Student attendance not done yet") {
          attendanceDone(false);
        } else {
          attendanceDone(true);
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  setAttendance(studentId, status) {
    try {
      isLoading(true);
      var response = controller.postAttendance(
        status: status,
        studentId: studentId,
        classId: 1.toString(),
        sectionId: 1.toString(),
        date: date,
        token: getSharedContoller.token,
      );
      if (response != null) {
        //sendNotificationToSection();
        print('Sucessfully update attendance of single student');
      }
    } catch (e) {
      Get.snackbar("Error", e.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    } finally {
      isLoading(false);
    }
  }

  // setAllPresent() async {
  //   try {
  //     isLoading(true);
  //     var response = controller.postAllAttendance(
  //       classId: getSharedContoller.teacherClassId,
  //       sectionId: getSharedContoller.teacherClassSectionId,
  //       date: date,
  //       token: getSharedContoller.token,
  //     );
  //     if (response != null) {
  //       await attendanceCheck(date);
  //       Get.snackbar("Sucessful", "Attendance updated sucessfully",
  //           snackPosition: SnackPosition.TOP,
  //           backgroundColor: Colors.green,
  //           colorText: Colors.white);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString(),
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

  // sendNotificationToSection() async {
  //   try {
  //     isLoading(true);
  //     var response = controller.sendNotificationToSection(
  //       title: 'Attendance',
  //       body: 'Attendance sunmitted',
  //       classId: 1.toString(),
  //       sectionId: 1.toString(),
  //       token: getSharedContoller.token,
  //     );
  //     if (response != null) {
  //       print('Sucessfully send notification to section');
  //       // Get.snackbar("Sucessful", "Notification sent sucessfully",
  //       //     snackPosition: SnackPosition.TOP,
  //       //     backgroundColor: Colors.green,
  //       //     colorText: Colors.white);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString(),
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.red,
  //         colorText: Colors.white);
  //   } finally {
  //     isLoading(false);
  //   }
  // }

}
