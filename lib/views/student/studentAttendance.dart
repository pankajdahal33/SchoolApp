import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/models/Attendance.dart';
import 'package:startupapplication/services/base_client.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class StudentAttendance extends StatefulWidget {
  const StudentAttendance({Key? key}) : super(key: key);

  @override
  State<StudentAttendance> createState() => _StudentAttendanceState();
}

class _StudentAttendanceState extends State<StudentAttendance> {
  Future<StudentAttendanceList>? attendances;

  AttendanceController attendanceController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  var _currentDate;
  var selectedDate;
  bool isLoading = false;
  @override
  void initState() {
    didChangeDependencies();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    setState(() {
      if (getSharedContoller.roleId == "3") {
        if (selectedDate == null) {
          selectedDate = DateTime.now();
          attendances = getAllStudentAttendance(
              id: getSharedContoller.childId,
              month: selectedDate.month.toString(),
              year: selectedDate.year.toString(),
              token: getSharedContoller.token);
        } else {
          attendances = getAllStudentAttendance(
              id: getSharedContoller.childId,
              month: selectedDate.month.toString(),
              year: selectedDate.year.toString(),
              token: getSharedContoller.token);
        }
      } else if (getSharedContoller.roleId == "2") {
        if (selectedDate == null) {
          selectedDate = DateTime.now();
          attendances = getAllStudentAttendance(
              id: getSharedContoller.userId,
              month: selectedDate.month.toString(),
              year: selectedDate.year.toString(),
              token: getSharedContoller.token);
        } else {
          attendances = getAllStudentAttendance(
              id: getSharedContoller.userId,
              month: selectedDate.month.toString(),
              year: selectedDate.year.toString(),
              token: getSharedContoller.token);
        }
      } else {
        if (selectedDate == null) {
          selectedDate = DateTime.now();
          attendances = getAllStudentAttendance(
              id: getSharedContoller.attendanceStudentId,
              month: selectedDate.month.toString(),
              year: selectedDate.year.toString(),
              token: getSharedContoller.token);
        } else {
          attendances = getAllStudentAttendance(
              id: getSharedContoller.attendanceStudentId,
              month: selectedDate.month.toString(),
              year: selectedDate.year.toString(),
              token: getSharedContoller.token);
        }
      }
    });
  }

  Future<StudentAttendanceList> getAllStudentAttendance({
    String? id,
    String? month,
    String? year,
    String? token,
  }) async {
    setState(() {
      isLoading = true;
      print(isLoading);
    });
    var endPoint = "student-my-attendance/$id?month=$month&year=$year";
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': '$token'
    };

    var response = await BaseClient()
        .get(ApiRequestController.apiBaseUrl, endPoint, headers);

    if (response == null) {
      throw Exception('Failed to load');
    } else {
      var jsonData = jsonDecode(response);
      print(response);
      setState(() {
        isLoading = false;
      });
      return StudentAttendanceList.fromJson(jsonData['data']['attendances']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Attendance',
          isBackButton: true,
        ),
      ),
      body: Opacity(
        opacity: isLoading ? 0.5 : 1.0,
        child: Stack(children: [
          isLoading ? Center(child: LoadingWidget()) : Container(),
          Column(
            children: <Widget>[
              Expanded(
                child: CalendarCarousel<Event>(
                  weekendTextStyle: TextStyle(
                    color: Colors.red,
                  ),
                  weekDayPadding: EdgeInsets.zero,
                  weekFormat: false,
                  onDayPressed: (DateTime date, List<Event> events) {
                    this.setState(() => _currentDate = date);
                  },
                  onCalendarChanged: (DateTime date) {
                    setState(() {
                      selectedDate = date;
                      if (getSharedContoller.roleId == "3") {
                        attendances = getAllStudentAttendance(
                            id: getSharedContoller.childId,
                            month: selectedDate.month.toString(),
                            year: selectedDate.year.toString(),
                            token: getSharedContoller.token);
                      } else if ((getSharedContoller.roleId == "2")) {
                        attendances = getAllStudentAttendance(
                            id: getSharedContoller.userId,
                            month: date.month.toString(),
                            year: date.year.toString(),
                            token: getSharedContoller.token);
                      } else {
                        attendances = getAllStudentAttendance(
                            id: getSharedContoller.attendanceStudentId,
                            month: date.month.toString(),
                            year: date.year.toString(),
                            token: getSharedContoller.token);
                      }
                    });
                  },
                  thisMonthDayBorderColor: Colors.grey,
                  daysTextStyle: Theme.of(context).textTheme.headline4,
                  showOnlyCurrentMonthDate: false,
                  headerTextStyle: Theme.of(context).textTheme.headline4,
                  weekdayTextStyle: Theme.of(context).textTheme.headline4,
                  customDayBuilder: (
                    bool isSelectable,
                    int index,
                    bool isSelectedDay,
                    bool isToday,
                    bool isPrevMonthDay,
                    TextStyle textStyle,
                    bool isNextMonthDay,
                    bool isThisMonthDay,
                    DateTime day,
                  ) {
                    return FutureBuilder<StudentAttendanceList>(
                      future: attendances,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          String status =
                              attendanceController.getAttendanceStatus(
                                  day.day, snapshot.data!.attendances);

                          if (isThisMonthDay) {
                            if (isToday) {
                              return Center(
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.6),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: Offset(0, 5),
                                        ),
                                      ]),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(day.day.toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1),
                                        Container(
                                          width: 10.0,
                                          height: 10.0,
                                          decoration: BoxDecoration(
                                            color: getStatusColor(status),
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                          ),
                                        ),
                                      ]),
                                ),
                              );
                            } else {
                              return Center(
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        day.day.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      SizedBox(
                                        width: 1.5,
                                      ),
                                      Container(
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          color: getStatusColor(status),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          } else {
                            return Center(
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      day.day.toString(),
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                        } else {
                          return Center(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text(day.day.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );
                  },
                  selectedDateTime: _currentDate,
                  todayButtonColor: Colors.transparent,
                  todayBorderColor: Colors.transparent,
                  todayTextStyle: Theme.of(context).textTheme.headline4,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Column(
                  // physics: NeverScrollableScrollPhysics(),
                  children: <Widget>[
                    bottomDesign('Present'.tr, 'P', Colors.green),
                    bottomDesign('Absent'.tr, 'A', Colors.red),
                    bottomDesign('Late'.tr, 'L', Color(0xFFEDD200)),
                    bottomDesign('Halfday'.tr, 'H', Colors.purpleAccent),
                    bottomDesign('Holiday'.tr, 'F', Colors.deepPurpleAccent),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }

  Widget bottomDesign(String title, String titleVal, Color color) {
    return FutureBuilder<StudentAttendanceList>(
      future: attendances,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  height: 20.0,
                  width: 50.0,
                  decoration: BoxDecoration(
                    color: color,
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Text(
                  title,
                  style: Theme.of(context).textTheme.headline4,
                )),
                Text(
                    attendanceController.getStatusCount(
                      titleVal,
                      snapshot.data!.attendances,
                    ),
                    style: Theme.of(context).textTheme.headline5),
              ],
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

getStatusColor(String status) {
  switch (status) {
    case 'P':
      return Colors.green;
    case 'A':
      return Colors.red;
    case 'L':
      return Color(0xFFEDD200);
    case 'H':
      return Colors.purpleAccent;
    case 'F':
      return Colors.deepPurple;
    default:
      return Colors.transparent;
  }
}
