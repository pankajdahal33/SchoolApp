import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/noticeController.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class StudentNoticePage extends StatefulWidget {
  const StudentNoticePage({Key? key}) : super(key: key);

  @override
  State<StudentNoticePage> createState() => _StudentNoticePageState();
}

class _StudentNoticePageState extends State<StudentNoticePage> {
  NoticeController noticeController = Get.find();

  @override
  void initState() {
    noticeController.getStudentNoticeList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Notice',
          isBackButton: true,
        ),
      ),
      body: Center(
          child: Obx(
        () => noticeController.isLoading.value
            ? LoadingWidget()
            : noticeController.studentNoticeList.data == null
                ? Text('No Data Found')
                : ListView.builder(
                    itemCount: noticeController
                        .studentNoticeList.data!.allNotices!.length,
                    itemBuilder: (context, i) {
                      var notice = noticeController
                          .studentNoticeList.data!.allNotices![i];
                      return Card(
                        child: ListTile(
                          title: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 35,
                                  backgroundColor:
                                      Theme.of(context).backgroundColor,
                                  child: Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      notice.noticeDate!
                                          .toString()
                                          .substring(0, 10),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      notice.noticeTitle!.toString(),
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Get.toNamed(
                                Routes.STUDENTENOTICEDETAIL,
                                arguments: notice,
                              );
                            },
                            icon: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      );
                    }),
      )),
    );
  }
}
