// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/classController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class ClassAttendaceTeacher extends StatefulWidget {
  const ClassAttendaceTeacher({Key? key}) : super(key: key);

  @override
  State<ClassAttendaceTeacher> createState() => _ClassAttendaceTeacherState();
}

class _ClassAttendaceTeacherState extends State<ClassAttendaceTeacher> {
  ClassController classController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  AttendanceController attendanceController = Get.find();
  var selectedClass;
  var selectedSection;
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    classController.getClassList();
    super.initState();
  }

  var isLoading = false;

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
      body: Center(
        child: Obx(
          () => classController.isLoadingClass.value
              ? LoadingWidget()
              : Column(
                  children: [
                    //Dropdown menu for selecting class
                    Card(
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
                            Utils.saveStringValue('teacherClassId',
                                selectedClass.toString().split("-").first);
                            Utils.saveStringValue('teacherClassSectionId',
                                selectedClass.toString().split("-").last);
                            await getSharedContoller.sharedPreferenceData();
                          },
                          items: classController.classList != null
                              ? classController.classList.data!.teacherClasses!
                                  .map<DropdownMenuItem<String>>((value) {
                                  return DropdownMenuItem<String>(
                                    value: value.classId.toString() +
                                        "-" +
                                        value.sectionId.toString(),
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                          value.className.toString() +
                                              "   Setion: " +
                                              value.sectionName.toString(),
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

                    // classController.isLoadingSection.value
                    //     ? Container(
                    //         height: 60,
                    //         width: MediaQuery.of(context).size.width,
                    //         padding: EdgeInsets.symmetric(horizontal: 10.0),
                    //         child: Card(),
                    //       )
                    //     : Card(
                    //         child: Container(
                    //           height: 60,
                    //           width: MediaQuery.of(context).size.width,
                    //           padding: EdgeInsets.symmetric(horizontal: 10.0),
                    //           child: DropdownButton<String>(
                    //             hint: Text('Select Section',
                    //                 style:
                    //                     Theme.of(context).textTheme.headline4),
                    //             value: selectedSection,
                    //             icon: const Icon(Icons.arrow_drop_down),
                    //             isExpanded: true,
                    //             iconSize: 24,
                    //             elevation: 16,
                    //             underline: Container(
                    //               height: 2,
                    //               color: Theme.of(context).backgroundColor,
                    //             ),
                    //             style: Theme.of(context)
                    //                 .textTheme
                    //                 .headline4!
                    //                 .copyWith(
                    //                     color: Theme.of(context).primaryColor),
                    //             onChanged: (String? newValue) {
                    //               setState(() {
                    //                 selectedSection = newValue!;
                    //               });
                    //               Utils.saveStringValue(
                    //                   'teacherClassSectionId', selectedSection);
                    //               getSharedContoller.sharedPreferenceData();
                    //             },
                    //             items: classController.classSectionList.data !=
                    //                     null
                    //                 ? classController
                    //                     .classSectionList.data!.teacherSections!
                    //                     .map<DropdownMenuItem<String>>((value) {
                    //                     return DropdownMenuItem<String>(
                    //                       value: value.sectionId.toString(),
                    //                       child: Padding(
                    //                         padding: const EdgeInsets.only(
                    //                             left: 8.0),
                    //                         child: Text(
                    //                             value.sectionName.toString(),
                    //                             style: Theme.of(context)
                    //                                 .textTheme
                    //                                 .headline4),
                    //                       ),
                    //                     );
                    //                   }).toList()
                    //                 : [],
                    //           ),
                    //         ),
                    //       ),

                    Card(
                      child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                            padding: EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.width / 3,
                            child: Center(
                                child: TextField(
                              controller: dateInput,
                              //editing controller of this TextField

                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  color: Theme.of(context).backgroundColor,
                                  icon: Icon(Icons.calendar_today),
                                  onPressed: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2100));

                                    if (pickedDate != null) {
                                      print(
                                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate =
                                          DateFormat('yyyy-MM-dd')
                                              .format(pickedDate);
                                      print(
                                          formattedDate); //formatted date output using intl package =>  2021-03-16
                                      setState(() {
                                        dateInput.text =
                                            formattedDate; //set output date to TextField value.
                                      });
                                    } else {}
                                  },
                                ),
                                border: InputBorder.none,
                                hintText: 'Select Date',
                              ),
                              readOnly: true,
                              //set it true, so that user will not able to edit text
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    //DateTime.now() - not to allow to choose before today.
                                    lastDate: DateTime(2100));

                                if (pickedDate != null) {
                                  print(
                                      pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(pickedDate);
                                  print(
                                      formattedDate); //formatted date output using intl package =>  2021-03-16
                                  setState(() {
                                    dateInput.text =
                                        formattedDate; //set output date to TextField value.
                                  });
                                } else {}
                              },
                            ))),
                      ),
                    ),

                    SizedBox(
                      height: 30,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        gradient: LinearGradient(
                          colors: [
                            Theme.of(context).backgroundColor,
                            Theme.of(context).scaffoldBackgroundColor,
                          ],
                        ),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          attendanceController.date = dateInput.text;
                          await attendanceController
                              .attendanceCheck(dateInput.text);
                        },
                        child: Text(
                          '       Submit        ',
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
