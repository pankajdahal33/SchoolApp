import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/SquareCardItem.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  GetSharedContoller getSharedContoller = Get.put(GetSharedContoller());
  UserController userController = Get.find();
  Future<bool> _willPopCallback() async {
    showExitDialog(context);
    return false;
  }

  final buttonNames = ["Attendance", "Notice", "FeeS", "Homework", "Exam"];
  final buttonIcons = [
    Icons.fingerprint,
    Icons.medical_information_sharp,
    Icons.money,
    Icons.home_work,
    Icons.assignment
  ];
  final buttonFunctions = [
    Routes.STUDENTATTENDANCE,
    Routes.STUDENTENOTICE,
    Routes.STUDENTFEE,
    Routes.STUDENTHOMEWORK,
    Routes.STUDENTEXAMPAGE
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
              Padding(
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
                            print("Current Card: $currentCard");
                            Get.toNamed(buttonFunctions[index]);
                          }),
                        );
                      }),
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
                        onTap: (() {
                          setState(() {
                            currentIndex = 0;
                          });
                        }),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(
                                Icons.dashboard_rounded,
                                color: currentIndex == 0
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              Text('Dashboard')
                            ])),
                      ),
                      InkWell(
                        onTap: (() {
                          Get.toNamed(Routes.STUDENTNOTIFICATION);
                          setState(() {
                            currentIndex = 1;
                          });
                        }),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(
                                Icons.notification_add_rounded,
                                color: currentIndex == 1
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              Text('Notification')
                            ])),
                      ),
                      InkWell(
                        onTap: (() {
                          Get.toNamed(Routes.STUDENTFEE);
                          setState(() {
                            currentIndex = 2;
                          });
                        }),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(
                                Icons.payments,
                                color: currentIndex == 2
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
                              Text('Fees')
                            ])),
                      ),
                      // InkWell(
                      //   onTap: (() {
                      //     setState(() {
                      //       currentIndex = 3;
                      //     });
                      //   }),
                      //   child: Container(
                      //       child: Column(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceEvenly,
                      //           children: [
                      //         Icon(
                      //           Icons.schedule,
                      //           color: currentIndex == 3
                      //               ? Theme.of(context).primaryColor
                      //               : null,
                      //         ),
                      //         Text('Routine')
                      //       ])),
                      // ),
                      InkWell(
                        onTap: (() async {
                          // userController.getProfile();
                          Get.toNamed(Routes.STUDENTPROFILE);
                          setState(() {
                            currentIndex = 3;
                          });
                        }),
                        child: Container(
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                              Icon(
                                Icons.person,
                                color: currentIndex == 4
                                    ? Theme.of(context).primaryColor
                                    : null,
                              ),
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

  int currentIndex = 0;
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
                        child: ElevatedButton(
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
                        child: ElevatedButton(
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
