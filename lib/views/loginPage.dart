import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/views/components/animation.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  UserController userController = Get.find();
  bool _obscureTextLogin = true;
  Future<bool> _willPopCallback() async {
    showExitDialog(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
          body: Obx(
        () => userController.isLoading.value == true
            ? Center(
                child: LoadingWidget(),
              )
            : Form(
                key: _formKey,
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          ClipPath(
                            clipper: WaveClipper2(),
                            child: Container(
                              child: Column(),
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Theme.of(context)
                                    .backgroundColor
                                    .withOpacity(0.5),
                                Theme.of(context)
                                    .backgroundColor
                                    .withOpacity(0.25)
                              ])),
                            ),
                          ),
                          ClipPath(
                            clipper: WaveClipper3(),
                            child: Container(
                              child: Column(),
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Theme.of(context).backgroundColor,
                                Theme.of(context)
                                    .backgroundColor
                                    .withOpacity(0.25)
                              ])),
                            ),
                          ),
                          ClipPath(
                            clipper: WaveClipper1(),
                            child: Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Image.asset(
                                    'images/logo.png',
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 150,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "Let\'s Start with Login!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 30),
                                  ),
                                ],
                              ),
                              width: double.infinity,
                              height: 300,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                Theme.of(context).backgroundColor,
                                Theme.of(context).backgroundColor
                              ])),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextFormField(
                            onChanged: (String value) {
                              setState(() {
                                userController.schoolId = value;
                                print(value);
                              });
                            },
                            keyboardType: TextInputType.number,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "SchoolId is required";
                              }
                              return null;
                            },
                            cursorColor: Theme.of(context).backgroundColor,
                            decoration: InputDecoration(
                                hintText: "School ID",
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Icon(
                                    Icons.mail_lock_rounded,
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextFormField(
                            onChanged: (String value) {
                              setState(() {
                                userController.email = value;
                                print(value);
                              });
                            },
                            keyboardType: TextInputType.emailAddress,
                            validator: (email) {
                              if (email!.isEmpty) {
                                return "Email is required";
                              } else if (!email.contains("@")) {
                                return "Please enter a valid email";
                              }
                              return null;
                            },
                            cursorColor: Theme.of(context).backgroundColor,
                            decoration: InputDecoration(
                                hintText: "Email Address",
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Icon(
                                    Icons.mail_lock_rounded,
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Material(
                          elevation: 2.0,
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          child: TextFormField(
                            onChanged: (String value) {
                              setState(() {
                                userController.password = value;
                                print(value);
                              });
                            },
                            validator: (loginPassword) {
                              if (loginPassword!.length < 4) {
                                return 'Password must be of more than 6 character';
                              } else {
                                return null;
                              }
                            },
                            onSaved: (loginPassword) =>
                                loginPassword = loginPassword,
                            obscureText: _obscureTextLogin,
                            cursorColor: Theme.of(context).backgroundColor,
                            decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: Material(
                                  elevation: 0,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  child: Icon(
                                    Icons.lock,
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.all(0),
                                  child: IconButton(
                                    icon: _obscureTextLogin
                                        ? Icon(
                                            Icons.remove_red_eye,
                                            color: Theme.of(context)
                                                .backgroundColor,
                                          )
                                        : Icon(
                                            Icons.panorama_fish_eye,
                                            color: Theme.of(context)
                                                .backgroundColor,
                                          ),
                                    onPressed: () {
                                      setState(() {
                                        _obscureTextLogin = !_obscureTextLogin;
                                      });
                                    },
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 13)),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        child: Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: (() async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                try {
                                  await userController.login();
                                } catch (e) {
                                  print(e.toString());
                                }
                              }
                            }),
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: MediaQuery.of(context).size.width,
                              decoration: Utils.gradientBtnDecoration,
                              child: Text('Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                          onTap: (() {
                            if (Get.isDialogOpen!) Get.back();
                            exit(0);
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
