import 'dart:convert';

import 'package:startupapplication/controllers/ApiBaseController/baseController.dart';
import 'package:startupapplication/models/ChildInfo.dart';
import 'package:startupapplication/models/Childrens.dart';
import 'package:startupapplication/models/Class.dart';
import 'package:startupapplication/models/ClassAttendance.dart';
import 'package:startupapplication/models/ClassStudent.dart';
import 'package:startupapplication/models/Fee.dart';
import 'package:startupapplication/models/Homework.dart';
import 'package:startupapplication/models/Login.dart';
import 'package:startupapplication/models/Attendance.dart';
import 'package:startupapplication/models/Notice.dart';
import 'package:startupapplication/models/Notification.dart';
import 'package:startupapplication/models/Profile.dart';
import 'package:startupapplication/models/Section.dart';
import 'package:startupapplication/models/TeacherNotice.dart';
import 'package:startupapplication/models/TeacherSubject.dart';
import 'package:startupapplication/services/base_client.dart';

class ApiRequestController with BaseController {
  static String baseUrl = "https://dummyuser.ml/";
  static String apiBaseUrl = baseUrl + "api/";

// post Login
  login({String? email, String? password}) async {
    var endPoint = "login?email=$email&password=$password";
    var headers = {'Content-Type': 'application/json'};
    var response = await BaseClient()
        .post(apiBaseUrl, endPoint, headers, null)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      // print(response);
      return Login.fromJson(response);
    }
  }

  getProfile({
    String? userId,
    String? token,
  }) async {
    var endPoint = "userprofile/$userId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .post(apiBaseUrl, endPoint, headers, null)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return Profile.fromJson(response);
    }
  }

  getstudentAttendance({
    String? studentId,
    String? month,
    String? year,
    String? token,
  }) async {
    var endPoint = "student-my-attendance/$studentId?month=$month&year=$year";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return Attendance.fromJson(response);
    }
  }

  getChildList({
    String? parentId,
    String? token,
  }) async {
    var endPoint = "child-list/$parentId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return Childrens.fromJson(response);
    }
  }

  getChildInfo({
    String? childId,
    String? token,
  }) async {
    var endPoint = "childInfo/$childId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return ChildInfo.fromJson(response);
    }
  }

  getClassList({
    String? teacherId,
    String? token,
  }) async {
    var endPoint = "teacher-class-list?id=$teacherId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return List<ClassList>.from(
          json.decode(response).map((x) => ClassList.fromMap(x)));
      //return ClassList.fromJson(response);
    }
  }

  getTeacherClassSection({
    String? teacherId,
    String? classId,
    String? token,
  }) async {
    var endPoint = "teacher-section-list?id=$teacherId&class=$classId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return Section.fromJson(response);
    }
  }

  getTeacherAllSubject({
    String? teacherId,
    String? token,
  }) async {
    var endPoint = "subject/$teacherId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return TeacherSubject.fromJson(response);
    }
  }

  getClassStudents({
    String? classId,
    String? sectionId,
    String? token,
  }) async {
    var endPoint = "search-student?section=$sectionId&class=$classId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return ClassStudent.fromJson(response);
    }
  }

  attendanceCheck({
    String? classId,
    String? sectionId,
    String? date,
    String? token,
  }) async {
    var endPoint =
        "student-attendance-check?date=$date&class=$classId&section=$sectionId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return ClassAttendance.fromJson(response);
    }
  }

  //post attendance
  postAttendance({
    dynamic classId,
    dynamic sectionId,
    String? date,
    String? token,
    String? status,
    dynamic studentId,
  }) async {
    var endPoint =
        "student-attendance-store-second?id=$studentId&attendance=$status&date=$date&class=$classId&section=$sectionId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return ClassAttendance.fromJson(response);
    }
  }

  postAllAttendance({
    dynamic classId,
    dynamic sectionId,
    String? date,
    String? token,
  }) async {
    var endPoint =
        "student-attendance-store-first?date=${date}&class=${classId}&section=${sectionId}";

    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return ClassAttendance.fromJson(response);
    }
  }

  sendNotificationToSection({
    String? sectionId,
    String? classId,
    String? token,
    String? title,
    String? body,
  }) {
    var endPoint =
        "homework-notification-api?body=$body&title=$title&class_id=$classId&section_id=$sectionId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    BaseClient().get(apiBaseUrl, endPoint, headers).catchError(handelError);
  }

  getTeacherNoticeList({
    String? schoolId,
    String? token,
  }) async {
    var endPoint = "school/$schoolId/notice-list";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return TeacherNotice.fromJson(response);
    }
  }

  getStudentNoticeList({
    String? studentId,
    String? token,
  }) async {
    var endPoint = "student-noticeboard/$studentId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return Notice.fromJson(response);
    }
  }

  getMyNotification({
    String? userId,
    String? token,
  }) async {
    var endPoint = "myNotification/$userId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return MyNotification.fromJson(response);
    }
  }

  markAsReadNotification({
    String? userId,
    String? notificationId,
    String? token,
  }) async {
    var endPoint = "viewNotification/$userId/$notificationId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return;
      //return MyNotification.fromJson(response);
    }
  }

  markReadAllNotification({String? userId, String? token}) async {
    var endPoint = "viewAllNotification/$userId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return;
    }
  }

  getStudentFeeList({
    String? studentId,
    String? token,
  }) async {
    var endPoint = "fees-collect-student-wise/$studentId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return Fee.fromJson(response);
    }
  }

  getStudentHomeworkList({
    String? studentId,
    String? token,
  }) async {
    var endPoint = "student-homework/$studentId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      return Homework.fromJson(response);
    }
  }

  getTeacherHomeworkList({
    String? teacherId,
    String? token,
  }) async {
    var endPoint = "homework-list/$teacherId";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };
    var response = await BaseClient()
        .get(apiBaseUrl, endPoint, headers)
        .catchError(handelError);

    if (response == null) {
      return;
    } else {
      print(response);
      //return TeacherHomework.fromJson(response);
    }
  }
}
