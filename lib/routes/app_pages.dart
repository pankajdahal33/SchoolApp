import 'package:get/get.dart';
import 'package:startupapplication/bindings/ParentHomeBinding.dart';
import 'package:startupapplication/bindings/SplashBinding.dart';
import 'package:startupapplication/bindings/StudentHomeBinding.dart';
import 'package:startupapplication/bindings/TeacherHomeBinding.dart';
import 'package:startupapplication/bindings/UserBinding.dart';
import 'package:startupapplication/bindings/attendanceBinding.dart';
import 'package:startupapplication/bindings/selectChildBinding.dart';
import 'package:startupapplication/bindings/studentProfileBinding.dart';
import 'package:startupapplication/bindings/teacherAttendanceBinging.dart';
import 'package:startupapplication/views/parent/parentHomePage.dart';
import 'package:startupapplication/views/loginPage.dart';
import 'package:startupapplication/views/parent/selectChildPage.dart';
import 'package:startupapplication/views/splash_screen.dart';
import 'package:startupapplication/views/student/studentAttendance.dart';
import 'package:startupapplication/views/student/studentHomePage.dart';
import 'package:startupapplication/views/student/studentProfile.dart';
import 'package:startupapplication/views/teacher/checkClassAttendance.dart';
import 'package:startupapplication/views/teacher/classAttendanceTeacher.dart';
import 'package:startupapplication/views/teacher/searchAttendanceTeacher.dart';
import 'package:startupapplication/views/teacher/teacherAttendance.dart';
import 'package:startupapplication/views/teacher/teacherHomePage.dart';

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
      name: _Paths.PARENTHOME,
      page: () => ParentHomePage(),
      binding: ParentHomeBinding(),
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
      name: _Paths.SEARCHATTENDANCE,
      page: () => SearchAttendaceTeacher(),
      binding: TeacherAttendanceBinding(),
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
  ];
}
