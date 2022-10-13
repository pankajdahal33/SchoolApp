// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/classController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class AddHomework extends StatefulWidget {
  const AddHomework({Key? key}) : super(key: key);

  @override
  State<AddHomework> createState() => _AddHomeworkState();
}

class _AddHomeworkState extends State<AddHomework> {
  ClassController classController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  var selectedClass;
  var selectedSubject;
  var selectedSection;

  @override
  void initState() {
    classController.getClassList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Add Homework',
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
                        value: selectedSubject,
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
                            selectedSubject = newValue!;
                          });
                          Utils.saveStringValue(
                              'teacherClassSubjectId', selectedSubject);
                          await getSharedContoller.sharedPreferenceData();
                          classController.getTeacherClassSection();
                        },
                        items: classController.classList != null
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
                        onChanged: (String? newValue) async {
                          setState(() {
                            selectedSection = newValue!;
                          });
                          Utils.saveStringValue(
                              'teacherClassSectionId', selectedSection);
                          await getSharedContoller.sharedPreferenceData();
                          classController.getTeacherAllSubject();
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
            () => classController.isLoadingSubject.value
                ? LoadingWidget()
                : Card(
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton<String>(
                        hint: Text('Select Subject',
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
                          // Utils.saveStringValue('teacherClassSubjectId',
                          //     selectedSubject); // ya subject id save garnu parxa
                          // await getSharedContoller.sharedPreferenceData();
                        },
                        items: classController.classTeacherSubjectList.data !=
                                null
                            ? classController
                                .classTeacherSubjectList.data!.subjectsName!
                                .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value.subjectId.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                        value.subjectName.toString() +
                                            " " +
                                            value.subjectCode.toString(),
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
          Text('Select Subject'),
          Text('Select Assign Date'),
          Text('Select Submission Date'),
          Text('Select File'),
          Text('Input Marks'),
          Text('Input Description'),
          Text('Submit'),
        ],
      ),
    );
  }
}
