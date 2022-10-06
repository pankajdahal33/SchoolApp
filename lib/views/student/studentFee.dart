import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/studentFeeController.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class StudentFeePage extends StatefulWidget {
  const StudentFeePage({Key? key}) : super(key: key);

  @override
  State<StudentFeePage> createState() => _StudentFeePageState();
}

class _StudentFeePageState extends State<StudentFeePage> {
  StudentFeeController studentFeeController = Get.find();

  @override
  void initState() {
    studentFeeController.getStudentFeeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Fees',
          isBackButton: true,
        ),
      ),
      body: Obx(() => studentFeeController.isLoading.value
          ? Center(
              child: LoadingWidget(),
            )
          : ListView.builder(
              itemCount: studentFeeController.studentFeeList.data!.fees!.length,
              itemBuilder: (context, index) {
                var fee =
                    studentFeeController.studentFeeList.data!.fees![index];

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
                                  'Fee Topic',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  fee.feesName!,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Due Date',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  fee.dueDate.toString().substring(0, 10),
                                  style: Theme.of(context).textTheme.bodyLarge,
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
                            const DataColumn(label: Text('Amount')),
                            const DataColumn(label: Text('Paid')),
                            const DataColumn(label: Text('Fine')),
                            const DataColumn(label: Text('Discount')),
                            const DataColumn(label: Text('Balance')),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Text("Rs." + fee.amount!)),
                                DataCell(Text("Rs." + fee.paid!)),
                                DataCell(Text("Rs." + fee.fine!.toString())),
                                DataCell(Text(
                                    "Rs." + fee.discountAmount!.toString())),
                                DataCell(Text("Rs." + fee.balance!.toString())),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )),
    );
  }
}
