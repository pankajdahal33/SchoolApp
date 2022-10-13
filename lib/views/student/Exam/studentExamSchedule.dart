import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/studentExamController.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class StudentExamSchedule extends StatefulWidget {
  const StudentExamSchedule({Key? key}) : super(key: key);

  @override
  State<StudentExamSchedule> createState() => _StudentExamScheduleState();
}

class _StudentExamScheduleState extends State<StudentExamSchedule> {
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
            title: 'Exam Schdeule',
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
                          studentExamController.getExamScheduleById(newValue);
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
                ? Container()
                : Expanded(
                    child: studentExamController.examSchedule.examRoutines ==
                            null
                        ? Center(
                            child: Text('No Data Found'),
                          )
                        : studentExamController.examSchedule.examRoutines! == 0
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
                                  DataColumn(label: Text('Date')),
                                  DataColumn(label: Text('Time')),
                                  DataColumn(label: Text('Room')),
                                ],
                                rows: studentExamController
                                    .examSchedule.examRoutines!.the20220916!
                                    .map((e) => DataRow(cells: [
                                          DataCell(Text(e.subject!)),
                                          DataCell(Text(e.date
                                              .toString()
                                              .substring(0, 10))),
                                          DataCell(Text(e.startTime! +
                                              ' \n ' +
                                              e.endTime!)),
                                          DataCell(Text(e.room!)),
                                        ]))
                                    .toList()),
                  ),
          ),
        ]));
  }
}
