import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/attendanceController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/themeService.dart';
import 'package:startupapplication/routes/app_pages.dart';

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  UserController userController = Get.find();
  AttendanceController attendanceController = Get.find();
  GetSharedContoller getSharedContoller = Get.put(GetSharedContoller());

  Future<bool> _willPopCallback() async {
    showExitDialog(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    getSharedContoller.sharedPreferenceData();
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          appBar: AppBar(
            leading: Image.asset(
              'images/logo.png',
              color: Colors.white,
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            title: Text('Welcome ${getSharedContoller.fullName}'),
            actions: [
              IconButton(
                onPressed: (() => ThemeService().switchTheme()),
                icon: Icon(
                  Icons.brightness_6,
                ),
              ),
              IconButton(
                onPressed: (() => showLogoutDialog(context)),
                icon: Icon(Icons.logout_outlined),
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.79,
                  child: GridView.builder(
                    itemCount: 1,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.STUDENTATTENDANCE);
                        },
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.qr_code_scanner,
                                size: 50,
                              ),
                              Text('Attendance')
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Spacer(),
              Container(
                color: Colors.transparent,
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: (() {}),
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Icon(
                              Icons.dashboard_rounded,
                              color: Theme.of(context).backgroundColor,
                            ),
                            Text('Dashboard')
                          ])),
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Icon(Icons.notification_add_rounded),
                            Text('Notification')
                          ])),
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Icon(Icons.payments), Text('Fees')])),
                    ),
                    InkWell(
                      onTap: (() {}),
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Icon(Icons.schedule),
                            Text('Routine')
                          ])),
                    ),
                    InkWell(
                      onTap: (() {
                        Get.toNamed(Routes.STUDENTPROFILE);
                      }),
                      child: Container(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Icon(Icons.person), Text('Profile')])),
                    ),
                  ],
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

  void showLogoutDialog(BuildContext context) {
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
                    "Do you want to logout?",
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
                          onPressed: () async {
                            userController.logout();
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
