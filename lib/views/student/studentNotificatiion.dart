import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/notificationController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class StudentNotification extends StatefulWidget {
  const StudentNotification({Key? key}) : super(key: key);

  @override
  State<StudentNotification> createState() => _StudentNotificationState();
}

class _StudentNotificationState extends State<StudentNotification> {
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
          child: Column(
            children: [
              InkWell(
                onTap: (() async {
                  await notificationController.markReadAllNotification();
                }),
                child: Container(
                  decoration: Utils.gradientBtnDecoration,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    'Mark All As Read',
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Obx(
                  () => notificationController.isLoading.value
                      ? LoadingWidget()
                      : notificationController.myNotificationList.data == null
                          ? Text('No Data Found')
                          : notificationController.myNotificationList.data!
                                      .unreadNotification ==
                                  0
                              ? Text('No Un-Notification Found')
                              : ListView.builder(
                                  itemCount: notificationController
                                      .myNotificationList
                                      .data!
                                      .unreadNotification,
                                  itemBuilder: (context, i) {
                                    var notification = notificationController
                                        .myNotificationList
                                        .data!
                                        .notifications![i];
                                    return Card(
                                      child: ListTile(
                                        onTap: (() async {
                                          notification.url == "notice-list"
                                              ? Get.toNamed(
                                                  Routes.STUDENTENOTICE)
                                              : print("");
                                          notification.url == "homework-list"
                                              ? Get.toNamed(
                                                  Routes.STUDENTHOMEWORK)
                                              : print("");
                                        }),
                                        title: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.1,
                                          child: Row(
                                            children: [
                                              CircleAvatar(
                                                radius: 35,
                                                backgroundColor:
                                                    Theme.of(context)
                                                        .backgroundColor,
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    child: Text(
                                                      notification.message!
                                                          .toString(),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        trailing: IconButton(
                                          onPressed: () {
                                            //Mark as read
                                            notificationController
                                                .markAsReadNotification(
                                                    notification.id!
                                                        .toString());
                                          },
                                          icon: Icon(Icons.mark_chat_read),
                                        ),
                                      ),
                                    );
                                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
