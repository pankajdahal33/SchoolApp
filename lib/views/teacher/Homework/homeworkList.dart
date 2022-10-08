import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/homeworkController.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class ViewHomeworkList extends StatefulWidget {
  const ViewHomeworkList({Key? key}) : super(key: key);

  @override
  State<ViewHomeworkList> createState() => _ViewHomeworkListState();
}

class _ViewHomeworkListState extends State<ViewHomeworkList> {
  HomeworkController homeworkController = Get.find();
  @override
  void initState() {
    homeworkController.getTeacherHomeworkList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'View Homework',
          isBackButton: true,
        ),
      ),
      body: Obx(() => homeworkController.isLoading.value
          ? Center(
              child: LoadingWidget(),
            )
          : ListView.builder(
              // itemCount: homeworkController.teachertHomeworkList.data!.length,
              itemCount: 5,
              itemBuilder: (context, index) {
                // var homeworkList =
                //     homeworkController.teachertHomeworkList.data![index];

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
                                  " homeworkList.subjectName!",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (() {
                                // showAlertDialog(context, homeworkList);
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
                            const DataColumn(label: Text('Evaluation')),
                            const DataColumn(label: Text('Total')),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                // DataCell(Text(homeworkList.homeworkDate!
                                //     .toString()
                                //     .substring(0, 10))),

                                DataCell(
                                  Text('skd'),
                                  // Text(
                                  // "  homeworkList.submissionDate!"
                                  //       .toString()
                                  //       .substring(0, 10),
                                  // ),
                                ),
                                DataCell(Text('skd')),
                                DataCell(Text('skd')),
                                DataCell(Text('skd')),
                                // DataCell(Text(homeworkList.obtainedMarks!)),
                                //  DataCell(Text(homeworkList.marks!)),
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
                                // Text(
                                //   homeworkList.createdBy!,
                                //   style: Theme.of(context).textTheme.bodyLarge,
                                // ),
                              ],
                            ),
                          ],
                        ),
                        // Text(
                        //   homeworkList.description!,
                        //   style: Theme.of(context).textTheme.bodyLarge,
                        // ),
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }
}
