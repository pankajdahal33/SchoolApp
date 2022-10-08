import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/SquareCardItem.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';

class TeacherHomePage extends StatefulWidget {
  @override
  _TeacherHomePageState createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  UserController userController = Get.find();
  AttendanceController attendanceController = Get.find();
  GetSharedContoller getSharedContoller = Get.put(GetSharedContoller());

  Future<bool> _willPopCallback() async {
    showExitDialog(context);
    return false;
  }

  final buttonNames = [
    "Attendance",
    "Notice",
    "HomeWork",
  ];
  final buttonIcons = [
    Icons.fingerprint,
    Icons.medical_information_sharp,
    Icons.home_work,
  ];
  final buttonFunctions = [
    Routes.ATTENDANCETEACHER,
    Routes.TEACHERNOTICE,
    Routes.TEACHERHOMEWORKPAGE
  ];
  int? currentCard;
  @override
  Widget build(BuildContext context) {
    getSharedContoller.sharedPreferenceData();
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: CustomAppBar(
              title: 'Welcome',
              isBackButton: false,
            ),
          ),
          body: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.74,
                    child: GridView.builder(
                        itemCount: buttonIcons.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return CardWidget(
                            isSelected: currentCard == index ? true : false,
                            name: buttonNames[index],
                            icon: Icon(buttonIcons[index]),
                            onTap: (() async {
                              setState(() {
                                currentCard = index;
                              });
                              Get.toNamed(buttonFunctions[index]);
                            }),
                          );
                        }),
                  ),
                ),
              ),
              Spacer(),
              Container(
                color: Theme.of(context).backgroundColor,
                height: 65,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (() {}),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(
                                Icons.dashboard_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text('Dashboard')
                            ])),
                      ),
                      InkWell(
                        onTap: (() {
                          Get.toNamed(Routes.TEACHERNOTIFICATION);
                        }),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(Icons.notification_add_rounded),
                              Text('Notification')
                            ])),
                      ),
                      InkWell(
                        onTap: (() {
                          Get.toNamed(Routes.ATTENDANCETEACHER);
                        }),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(Icons.fingerprint),
                              Text('Attendance')
                            ])),
                      ),
                      InkWell(
                        onTap: (() {}),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(Icons.schedule),
                              Text('Routine')
                            ])),
                      ),
                      InkWell(
                        onTap: (() {
                          Get.toNamed(Routes.TEACHERPROFILE);
                        }),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(Icons.person),
                              Text('Profile')
                            ])),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void showExitDialog(BuildContext context) {
    Get.dialog(
      Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 0.0,
        child: new Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                top: 66.0 + 16.0,
                bottom: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              margin: EdgeInsets.only(top: 66.0),
              decoration: new BoxDecoration(
                color: Theme.of(context).primaryColor,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 16.0,
                    offset: const Offset(0.0, 16.0),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Warning!!!",
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).backgroundColor),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    "Do you want to close this application?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            Get.back();
                            //Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "   No   ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            if (Get.isDialogOpen!) Get.back();
                            exit(0);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              " YES ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              left: 24.0 + 66.0,
              right: 24.0 + 66.0,
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: AssetImage('images/logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
