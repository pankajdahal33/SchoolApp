import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/fileUp_DownlaodController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/homeworkController.dart';
import 'package:startupapplication/helpers/permission_check.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';
import 'package:startupapplication/views/student/Homework/uploadHomework.dart';

class StudentHomeworkPage extends StatefulWidget {
  const StudentHomeworkPage({Key? key}) : super(key: key);

  @override
  State<StudentHomeworkPage> createState() => _StudentHomeworkPageState();
}

class _StudentHomeworkPageState extends State<StudentHomeworkPage> {
  HomeworkController homeworkController = Get.find();
  UpDownlaodController upDownlaodController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  void initState() {
    homeworkController.getStudentHomeworkList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Homework',
          isBackButton: true,
        ),
      ),
      body: Obx(() => homeworkController.isLoading.value
          ? Center(
              child: LoadingWidget(),
            )
          : ListView.builder(
              itemCount: homeworkController.studentHomeworkList.data!.length,
              itemBuilder: (context, index) {
                var homeworkList =
                    homeworkController.studentHomeworkList.data![index];

                return Card(
                  color: Theme.of(context).backgroundColor,
                  child: ListTile(
                    //title: DataTable,
                    subtitle: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Subject',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  homeworkList.subjectName!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (() {
                                showAlertDialog(context, homeworkList);
                              }),
                              child: Text(
                                'View',
                                style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                    fontSize: 20,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          ],
                        ),
                        DataTable(
                          dividerThickness: 5,
                          horizontalMargin: 5,
                          columnSpacing:
                              MediaQuery.of(context).size.width * 0.07,
                          columns: [
                            const DataColumn(label: Text('Created')),
                            const DataColumn(label: Text('Submission')),
                            const DataColumn(label: Text('F.M')),
                            const DataColumn(label: Text('O.M')),
                            const DataColumn(label: Text('Status')),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Text(homeworkList.homeworkDate!
                                    .toString()
                                    .substring(0, 10))),
                                DataCell(
                                  Text(
                                    homeworkList.submissionDate!
                                        .toString()
                                        .substring(0, 10),
                                  ),
                                ),
                                DataCell(Text(homeworkList.marks!)),
                                DataCell(Text(homeworkList.obtainedMarks!)),
                                DataCell(Text(homeworkList.status!)),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Description',
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Given By',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  homeworkList.createdBy!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          homeworkList.description!,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }

  showAlertDialog(BuildContext context, homework) {
    showDialog<void>(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(0),
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Card(
                        color: Theme.of(context).backgroundColor,
                        child: ListTile(
                          //title: DataTable,
                          subtitle: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Subject',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      Text(
                                        homework.subjectName!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              DataTable(
                                dividerThickness: 5,
                                horizontalMargin: 0,
                                columnSpacing: 20,
                                columns: [
                                  const DataColumn(label: Text('Created')),
                                  const DataColumn(label: Text('Submission')),
                                  const DataColumn(label: Text('F.M')),
                                  const DataColumn(label: Text('O.M')),
                                  const DataColumn(label: Text('Status')),
                                ],
                                rows: [
                                  DataRow(
                                    cells: [
                                      DataCell(Text(homework.homeworkDate!
                                          .toString()
                                          .substring(0, 10))),
                                      DataCell(
                                        Text(
                                          homework.submissionDate!
                                              .toString()
                                              .substring(0, 10),
                                        ),
                                      ),
                                      DataCell(Text(homework.marks!)),
                                      DataCell(Text(homework.obtainedMarks!)),
                                      DataCell(Text(homework.status!)),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Description',
                                    style:
                                        Theme.of(context).textTheme.headline4,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Given By',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                      Text(
                                        homework.createdBy!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                homework.description!,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Material(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              homework.file == ""
                                  ? Container()
                                  : InkWell(
                                      onTap: () {
                                        PermissionCheck()
                                            .checkPermissions(context);
                                        showDownloadAlertDialog(
                                            context, homework);
                                      },
                                      child: Container(
                                        color:
                                            Theme.of(context).backgroundColor,
                                        alignment: Alignment.center,
                                        width:
                                            MediaQuery.of(context).size.width /
                                                3,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                15,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Icon(Icons.cloud_download),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'Download',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                              getSharedContoller.roleId == "2"
                                  ? homework.status == "incompleted"
                                      ? InkWell(
                                          child: Container(
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            alignment: Alignment.center,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                15,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Icon(Icons.cloud_upload),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  "Upload",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ),
                                              ],
                                            ),
                                          ),
                                          onTap: () {
                                            showDialog<void>(
                                              barrierDismissible: true,
                                              context: context,
                                              builder: (BuildContext context) {
                                                return UploadHomework(
                                                  homework: homework,
                                                  upDownController:
                                                      upDownlaodController,
                                                );
                                              },
                                            );
                                          },
                                        )
                                      : Container()
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  showDownloadAlertDialog(BuildContext context, dynamic homework) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Get.back();
      },
    );
    Widget yesButton = TextButton(
      child: Text("Download"),
      onPressed: () {
        homework.file != null && homework.file != ""
            ? upDownlaodController.downloadFile(
                homework.file, context, homework.subjectName)
            : Get.snackbar('Sorry', 'No attachment found',
                backgroundColor: Colors.red,
                colorText: Colors.white,
                snackPosition: SnackPosition.TOP);
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Download",
        style: Theme.of(context).textTheme.headline5,
      ),
      content: Text("Would you like to download the file?"),
      actions: [
        cancelButton,
        yesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
