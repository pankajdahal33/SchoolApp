import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/classController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class SearchAttendaceTeacher extends StatefulWidget {
  const SearchAttendaceTeacher({Key? key}) : super(key: key);

  @override
  State<SearchAttendaceTeacher> createState() => _SearchAttendaceTeacherState();
}

class _SearchAttendaceTeacherState extends State<SearchAttendaceTeacher> {
  ClassController classController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  AttendanceController attendanceController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: const Text('View Attendance'),
      ),
      body: Obx(
        () => classController.isLoading.value
            ? LoadingWidget()
            : Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      classController.classStudentList.data!.students!.length,
                  itemBuilder: (context, i) {
                    // Map of students
                    return Column(
                      key: Key(i.toString()),
                      children: [
                        ListTile(
                          trailing: IconButton(
                              onPressed: (() async {
                                Utils.saveStringValue(
                                    'attendanceStudentId',
                                    classController.classStudentList.data!
                                        .students![i].userId
                                        .toString());
                                await getSharedContoller.sharedPreferenceData();
                                await Get.toNamed(Routes.STUDENTATTENDANCE);
                              }),
                              icon: Icon(Icons.remove_red_eye)),
                          tileColor: Theme.of(context).dialogBackgroundColor,
                          leading: CircleAvatar(
                            radius: 25,
                            child: Text(classController.classStudentList.data!
                                    .students![i].rollNo ??
                                ""),
                          ),
                          title: Text(
                            classController
                                .classStudentList.data!.students![i].fullName!,
                            style: Theme.of(context).textTheme.headline4,
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                classController.classStudentList.data!
                                        .students![i].className! +
                                    "     ||     Section: " +
                                    classController.classStudentList.data!
                                        .students![i].sectionName!,
                                style: TextStyle(fontWeight: FontWeight.bold),
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
      ),
    );
  }
}
