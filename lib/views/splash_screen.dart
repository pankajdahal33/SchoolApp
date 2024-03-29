import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/routes/app_pages.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {
  GetSharedContoller getSharedContoller = Get.put(GetSharedContoller());
  UserController userController = Get.find();

  @override
  void initState() {
    FirebaseMessaging _firebaseMessaging =
        FirebaseMessaging.instance; // Change here
    _firebaseMessaging.getToken().then((token) {
      print("token is $token");
    }, onError: (e) {
      print("error is $e");
    });
    super.initState();
    checkAuth();
  }

  void checkAuth() async {
    Timer(Duration(seconds: 3), () async {
      getSharedContoller.sharedPreferenceData();
      print(getSharedContoller.token);
      if (getSharedContoller.isLoggedIn == "true") {
        userController.getProfile();
        Timer(Duration(seconds: 3), () {
          if (getSharedContoller.roleId == "1" ||
              getSharedContoller.roleId == "4" ||
              getSharedContoller.roleId == "5") {
            Get.toNamed(Routes.TEACHERHOME);
          } else if (getSharedContoller.roleId == "2") {
            Get.toNamed(Routes.STUDENTHOME);
          } else if (getSharedContoller.roleId == "3") {
            Get.toNamed(Routes.SELECTCHILD);
          }
        });
      } else {
        Get.toNamed(Routes.LOGIN);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'images/logo.png',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
              SizedBox(height: 50),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: LinearProgressIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
