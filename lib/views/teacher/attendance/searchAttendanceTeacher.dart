import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/classController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
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
  void initState() {
    classController.getClassList();
    super.initState();
  }

  var selectedClass;
  var selectedSection;
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
      body: Column(
        children: [
          Obx(
            () => classController.isLoadingClass.value
                ? LoadingWidget()
                : Card(
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton<String>(
                        hint: Text('Select Class',
                            style: Theme.of(context).textTheme.headline4),
                        value: selectedClass,
                        icon: const Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).backgroundColor,
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Theme.of(context).primaryColor),
                        onChanged: (String? newValue) async {
                          setState(() {
                            selectedClass = newValue!;
                          });
                          Utils.saveStringValue(
                              'teacherClassId', selectedClass);
                          await getSharedContoller.sharedPreferenceData();
                          classController.getTeacherClassSection();
                        },
                        items: classController.classList.data != null
                            ? classController.classList.data!.teacherClasses!
                                .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value.classId.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(value.className.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                  ),
                                );
                              }).toList()
                            : [],
                      ),
                    ),
                  ),
          ),
          Obx(
            () => classController.isLoadingSection.value
                ? Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Card(),
                  )
                : Card(
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton<String>(
                        hint: Text('Select Section',
                            style: Theme.of(context).textTheme.headline4),
                        value: selectedSection,
                        icon: const Icon(Icons.arrow_drop_down),
                        isExpanded: true,
                        iconSize: 24,
                        elevation: 16,
                        underline: Container(
                          height: 2,
                          color: Theme.of(context).backgroundColor,
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Theme.of(context).primaryColor),
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedSection = newValue!;
                          });
                          Utils.saveStringValue(
                              'teacherClassSectionId', selectedSection);
                          getSharedContoller.sharedPreferenceData();
                          classController.getClassStudents();
                        },
                        items: classController.classSectionList.data != null
                            ? classController
                                .classSectionList.data!.teacherSections!
                                .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value.sectionId.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(value.sectionName.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                  ),
                                );
                              }).toList()
                            : [],
                      ),
                    ),
                  ),
          ),
          Obx(
            () => classController.isLoading.value
                ? LoadingWidget()
                : classController.classStudentList.data != null
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.67,
                        child: classController
                                    .classStudentList.data!.students!.length !=
                                0
                            ? ListView.builder(
                                shrinkWrap: true,
                                itemCount: classController
                                    .classStudentList.data!.students!.length,
                                itemBuilder: (context, i) {
                                  // Map of students
                                  return Column(
                                    key: Key(i.toString()),
                                    children: [
                                      ListTile(
                                        trailing: IconButton(
                                            onPressed: (() async {
                                              Utils.saveStringValue(
                                                  'selectedStudentId',
                                                  classController
                                                      .classStudentList
                                                      .data!
                                                      .students![i]
                                                      .userId
                                                      .toString());
                                              await getSharedContoller
                                                  .sharedPreferenceData();
                                              await Get.toNamed(
                                                  Routes.STUDENTATTENDANCE);
                                            }),
                                            icon: Icon(Icons.remove_red_eye)),
                                        tileColor: Theme.of(context)
                                            .dialogBackgroundColor,
                                        leading: CircleAvatar(
                                          radius: 25,
                                          child: Text(classController
                                                  .classStudentList
                                                  .data!
                                                  .students![i]
                                                  .rollNo ??
                                              ""),
                                        ),
                                        title: Text(
                                          classController.classStudentList.data!
                                              .students![i].fullName!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        subtitle: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              classController
                                                      .classStudentList
                                                      .data!
                                                      .students![i]
                                                      .className! +
                                                  "     ||     Section: " +
                                                  classController
                                                      .classStudentList
                                                      .data!
                                                      .students![i]
                                                      .sectionName!,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
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
                              )
                            : Container(
                                child: Center(
                                  child: Text("No Student Found"),
                                ),
                              ),
                      )
                    : Container(
                        child: Center(
                          child: Text('No Students Found'),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
