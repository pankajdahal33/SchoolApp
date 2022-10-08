import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/notificationController.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class TeacherNotification extends StatefulWidget {
  const TeacherNotification({Key? key}) : super(key: key);

  @override
  State<TeacherNotification> createState() => _TeacherNotificationState();
}

class _TeacherNotificationState extends State<TeacherNotification> {
  NotificationController notificationController = Get.find();

  @override
  void initState() {
    notificationController.getMyNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Notification',
          isBackButton: true,
        ),
      ),
      body: Container(
        child: Center(
          child: Obx(
            () => notificationController.isLoading.value
                ? LoadingWidget()
                : notificationController.myNotificationList.data == null
                    ? Text('No Data Found')
                    : notificationController
                                .myNotificationList.data!.unreadNotification ==
                            0
                        ? Text('No Un-Notification Found')
                        : ListView.builder(
                            itemCount: notificationController
                                .myNotificationList.data!.unreadNotification,
                            itemBuilder: (context, i) {
                              var notification = notificationController
                                  .myNotificationList.data!.notifications![i];
                              return Card(
                                child: ListTile(
                                  onTap: (() async {
                                    notification.url == "notice-list"
                                        ? Get.toNamed(Routes.TEACHERNOTICE)
                                        : print("");
                                  }),
                                  title: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              notification.date!
                                                  .toString()
                                                  .substring(0, 10),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              notification.message!.toString(),
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
                                      notificationController
                                          .markAsReadNotification(
                                              notification.id!.toString());
                                    },
                                    icon: Icon(Icons.mark_chat_read),
                                  ),
                                ),
                              );
                            }),
          ),
        ),
      ),
    );
  }
}
