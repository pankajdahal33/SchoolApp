// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/helpers/themeService.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/animation.dart';

class CustomAppBar extends StatefulWidget {
  final String title;
  final bool isBackButton;
  CustomAppBar({Key? key, required this.title, required this.isBackButton})
      : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  UserController userController = Get.put(UserController());
  GetSharedContoller getSharedContoller = Get.find();
  bool? isDarkMode = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).backgroundColor.withOpacity(0.5),
              Theme.of(context).backgroundColor.withOpacity(0.25)
            ])),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).backgroundColor,
              Theme.of(context).backgroundColor.withOpacity(0.25)
            ])),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            child: Column(),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).backgroundColor,
              Theme.of(context).backgroundColor
            ])),
          ),
        ),
        widget.isBackButton
            ? Positioned(
                child: IconButton(
                  onPressed: (() {
                    Get.back();
                  }),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                bottom: 30,
                left: 10)
            : Positioned(
                child: Image.asset(
                  'images/logo.png',
                  height: 60,
                  width: 60,
                ),
                bottom: 30,
                left: 10),
        Positioned(
            child: Row(
              children: [
                getSharedContoller.roleId == "3"
                    ? IconButton(
                        onPressed: (() async {
                          Get.toNamed(Routes.SELECTCHILD);
                        }),
                        icon: Icon(
                          Icons.switch_account,
                          size: 30,
                        ),
                      )
                    : Container(),
                IconButton(
                  onPressed: (() {
                    ThemeService().switchTheme();
                    setState(() {
                      isDarkMode = !isDarkMode!;
                    });
                  }),
                  icon: !isDarkMode!
                      ? Icon(
                          Icons.dark_mode,
                          size: 30,
                        )
                      : Icon(
                          Icons.light_mode,
                          size: 30,
                        ),
                ),
                IconButton(
                  onPressed: (() async {
                    showLogoutDialog(context);
                  }),
                  icon: Icon(
                    Icons.logout,
                    size: 30,
                  ),
                ),
              ],
            ),
            bottom: 40,
            right: 10),
        Positioned(
            child: Container(
              // Background
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width,
            ),
            bottom: 20,
            right: 35),
      ],
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
                        child: InkWell(
                          onTap: (() {
                            Get.back();
                          }),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: Utils.gradientBtnDecoration,
                            child: Text('No',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: (() async {
                            userController.logout();
                          }),
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: Utils.gradientBtnDecoration,
                            child: Text('Yes',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700)),
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
