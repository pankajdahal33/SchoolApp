import 'package:get/get.dart';
import 'package:startupapplication/bindings/SplashBinding.dart';
import 'package:startupapplication/bindings/StudentHomeBinding.dart';
import 'package:startupapplication/bindings/TeacherHomeBinding.dart';
import 'package:startupapplication/bindings/UserBinding.dart';
import 'package:startupapplication/bindings/attendanceBinding.dart';
import 'package:startupapplication/bindings/selectChildBinding.dart';
import 'package:startupapplication/bindings/studentFeeBinding.dart';
import 'package:startupapplication/bindings/studentHomeworkBinding.dart';
import 'package:startupapplication/bindings/studentNoticeBinding.dart';
import 'package:startupapplication/bindings/studentProfileBinding.dart';
import 'package:startupapplication/bindings/teacherAttendanceBinging.dart';
import 'package:startupapplication/bindings/teacherNoticeBinding.dart';
import 'package:startupapplication/bindings/teacherProfileBinding.dart';
import 'package:startupapplication/views/loginPage.dart';
import 'package:startupapplication/views/parent/selectChildPage.dart';
import 'package:startupapplication/views/splash_screen.dart';
import 'package:startupapplication/views/student/Homework/studentHomework.dart';
import 'package:startupapplication/views/student/Notice/studentNoticeDetailPage.dart';
import 'package:startupapplication/views/student/Notice/studentNoticePage.dart';
import 'package:startupapplication/views/student/studentAttendance.dart';
import 'package:startupapplication/views/student/studentFee.dart';
import 'package:startupapplication/views/student/studentHomePage.dart';
import 'package:startupapplication/views/student/studentProfile.dart';
import 'package:startupapplication/views/teacher/Notice/teacherNoticeDetailPage.dart';
import 'package:startupapplication/views/teacher/Notice/teacherNoticePage.dart';
import 'package:startupapplication/views/teacher/attendance/checkClassAttendance.dart';
import 'package:startupapplication/views/teacher/attendance/classAttendanceTeacher.dart';
import 'package:startupapplication/views/teacher/attendance/searchAttendanceTeacher.dart';
import 'package:startupapplication/views/teacher/attendance/teacherAttendance.dart';

import 'package:startupapplication/views/teacher/teacherHomePage.dart';
import 'package:startupapplication/views/teacher/teacherProfile.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginPage(),
      binding: UserBinding(),
    ),
    GetPage(
      name: _Paths.SELECTCHILD,
      page: () => SelectChildPage(),
      binding: SelectChildBinding(),
    ),
    GetPage(
      name: _Paths.TEACHERHOME,
      page: () => TeacherHomePage(),
      binding: TeacherHomeBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCETEACHER,
      page: () => TeacherAttendance(),
      binding: TeacherAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.CLASSATTENDANCE,
      page: () => ClassAttendaceTeacher(),
      binding: TeacherAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.CHECKCLASSATTENDANCE,
      page: () => CheckClassAttendance(),
      binding: TeacherAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.TEACHERNOTICE,
      page: () => TeacherNoticePage(),
      binding: TeacherNoticeBinding(),
    ),
    GetPage(
      name: _Paths.TEACHERNOTICEDETAIL,
      page: () => TeacherNoticeDetailPage(),
      binding: TeacherNoticeBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHATTENDANCE,
      page: () => SearchAttendaceTeacher(),
      binding: TeacherAttendanceBinding(),
    ),
    GetPage(
      name: _Paths.TEACHERPROFILE,
      page: () => TeacherProfile(),
      binding: TeacherProfileBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTHOME,
      page: () => StudentHomePage(),
      binding: StudentHomeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTATTENDANCE,
      page: () => StudentAttendance(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTPROFILE,
      page: () => StudentProfile(),
      binding: StudentProfileBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTNOTICE,
      page: () => StudentNoticePage(),
      binding: StudentNoticeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTNOTICEDETAIL,
      page: () => StudentNoticeDetailPage(),
      binding: StudentNoticeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTFEE,
      page: () => StudentFeePage(),
      binding: StudentFeeBinding(),
    ),
    GetPage(
      name: _Paths.STUDENTHOMEWORK,
      page: () => StudentHomeworkPage(),
      binding: StudentHomeworkBinding(),
    ),
  ];
}
