import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/studentExamController.dart';

import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class StudentExamResult extends StatefulWidget {
  const StudentExamResult({Key? key}) : super(key: key);

  @override
  State<StudentExamResult> createState() => _StudentExamResultState();
}

class _StudentExamResultState extends State<StudentExamResult> {
  StudentExamController studentExamController = Get.find();
  @override
  void initState() {
    studentExamController.getStudentExamTypeList();
    super.initState();
  }

  var selectedExam;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            title: 'Exam Result',
            isBackButton: true,
          ),
        ),
        body: Column(children: [
          Obx(
            (() => studentExamController.isLoading.value
                ? LoadingWidget()
                : Card(
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: DropdownButton<String>(
                        hint: Text('Select Exam Type',
                            style: Theme.of(context).textTheme.headline4),
                        value: selectedExam,
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
                            selectedExam = newValue!;
                          });
                          studentExamController.getExamResultById(newValue);
                        },
                        items: studentExamController
                                    .examScheduleTypeList.examTypes !=
                                null
                            ? studentExamController
                                .examScheduleTypeList.examTypes!
                                .map<DropdownMenuItem<String>>((value) {
                                return DropdownMenuItem<String>(
                                  value: value.id.toString(),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(value.title.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4),
                                  ),
                                );
                              }).toList()
                            : [],
                      ),
                    ),
                  )),
          ),
          Obx(
            () => studentExamController.isLoadingSchdeule.value
                ? LoadingWidget()
                : Expanded(
                    child: studentExamController.examResult.data == null
                        ? Center(
                            child: Text('No Data Found'),
                          )
                        : studentExamController
                                    .examResult.data!.examResult!.length ==
                                0
                            ? Center(
                                child: Text('No Data Found'),
                              )
                            : DataTable(
                                dividerThickness: 5,
                                horizontalMargin: 5,
                                columnSpacing:
                                    MediaQuery.of(context).size.width * 0.07,
                                columns: [
                                  DataColumn(label: Text('Subject')),
                                  DataColumn(label: Text('Total Marks')),
                                  DataColumn(label: Text('Obtained Marks')),
                                  DataColumn(label: Text('grade')),
                                ],
                                rows: studentExamController
                                    .examResult.data!.examResult!
                                    .map((e) => DataRow(cells: [
                                          DataCell(Text(e.subjectName!)),
                                          DataCell(Text(e.totalMarks!)),
                                          DataCell(Text(e.obtainedMarks!)),
                                          DataCell(Text(e.grade!)),
                                        ]))
                                    .toList()),
                  ),
          ),
        ]));
  }
}
