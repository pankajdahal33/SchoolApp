import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class CheckClassAttendance extends StatefulWidget {
  const CheckClassAttendance({Key? key}) : super(key: key);

  @override
  State<CheckClassAttendance> createState() => _CheckClassAttendanceState();
}

class _CheckClassAttendanceState extends State<CheckClassAttendance> {
  AttendanceController attendanceController = Get.find();
  var totalStudent;

  var attendanceFields = [
    'P',
    'L',
    'A',
    'H',
  ];
  dynamic currentSelectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("Class Attendance" + ' ' + attendanceController.date!),
      ),
      body: Obx(
        () => attendanceController.isLoading.value
            ? LoadingWidget()
            : Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    !attendanceController.attendanceDone.value
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Student attendance not done yet",
                                    style: TextStyle(fontSize: 15)),
                                Text("Select Present/Late/Absent/Halfday",
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Student attendance already done",
                                    style: TextStyle(fontSize: 15)),
                                Text("You can update the attendance",
                                    style: TextStyle(fontSize: 15)),
                                Text("Select Present/Late/Absent/Halfday",
                                    style: TextStyle(fontSize: 15)),
                              ],
                            ),
                          ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.80,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: attendanceController
                            .classAttendanceList.data!.length,
                        itemBuilder: (context, i) {
                          // Map of students
                          return Column(
                            key: Key(i.toString()),
                            children: [
                              ListTile(
                                tileColor:
                                    Theme.of(context).dialogBackgroundColor,
                                leading: CircleAvatar(
                                  radius: 25,
                                  child: Text(attendanceController
                                          .classAttendanceList
                                          .data![i]
                                          .rollNo ??
                                      ""),
                                ),
                                title: Text(
                                  attendanceController
                                      .classAttendanceList.data![i].fullName!,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      attendanceController.classAttendanceList
                                              .data![i].className! +
                                          "     ||     Section: " +
                                          attendanceController
                                              .classAttendanceList
                                              .data![i]
                                              .sectionName!,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 50,
                                      child: ListView.builder(
                                        itemCount: 4,
                                        physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, j) {
                                          // Map of attendance fields
                                          return GestureDetector(
                                            key: Key(attendanceFields[j]),
                                            onTap: () {
                                              attendanceController
                                                      .classAttendanceList
                                                      .data![i]
                                                      .attendanceType =
                                                  attendanceFields[j];

                                              setState(() {
                                                attendanceController
                                                    .setAttendance(
                                                  attendanceController
                                                      .classAttendanceList
                                                      .data![i]
                                                      .studentId,
                                                  attendanceController
                                                      .classAttendanceList
                                                      .data![i]
                                                      .attendanceType!,
                                                );
                                              });
                                              print(attendanceFields[j]);
                                              print(attendanceController
                                                  .classAttendanceList
                                                  .data![i]
                                                  .attendanceType);
                                            },
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 4.0,
                                                      horizontal: 2),
                                              child: Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5.6,
                                                decoration: BoxDecoration(
                                                    color: attendanceController
                                                                .classAttendanceList
                                                                .data![i]
                                                                .attendanceType ==
                                                            attendanceFields[j]
                                                        ? Colors.red
                                                        : Theme.of(context)
                                                            .selectedRowColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                    border: Border.all(
                                                        color: Theme.of(context)
                                                            .backgroundColor)),
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(vertical: 2.0),
                                                  child: Text(
                                                    attendanceFields[j],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Theme.of(context)
                                                            .backgroundColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              )
                            ],
                          );
                        },
                      ),
                    ),
                    // Center(
                    //   child: Padding(
                    //     padding: EdgeInsets.only(
                    //         bottom: 15.0, left: 10.0, right: 10.0, top: 10.0),
                    //     child: GestureDetector(
                    //       child: Container(
                    //         alignment: Alignment.center,
                    //         width: MediaQuery.of(context).size.width * 0.5,
                    //         height: 50.0,
                    //         decoration: Utils.gradientBtnDecoration,
                    //         child: Text(
                    //           "Set Remaining Present",
                    //           style: TextStyle(
                    //               color: Colors.white,
                    //               fontSize: 18.0,
                    //               fontWeight: FontWeight.bold),
                    //         ),
                    //       ),
                    //       onTap: () async {
                    //         await attendanceController.setAllPresent();
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
      ),
    );
  }
}
