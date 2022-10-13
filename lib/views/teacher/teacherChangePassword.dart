import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/views/components/animation.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class TeacherChangePassword extends StatefulWidget {
  const TeacherChangePassword({Key? key}) : super(key: key);

  @override
  State<TeacherChangePassword> createState() => _TeacherChangePasswordState();
}

class _TeacherChangePasswordState extends State<TeacherChangePassword> {
  final _formKey = GlobalKey<FormState>();
  UserController userController = Get.find();
  bool _obscureTextLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            title: 'Change Password',
            isBackButton: true,
          ),
        ),
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
                                height: 100,
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
                                height: 100,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(colors: [
                                  Theme.of(context).backgroundColor,
                                  Theme.of(context)
                                      .backgroundColor
                                      .withOpacity(0.25)
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
                                  userController.currentPassword = value;
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
                                  hintText: "Current Password",
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
                                          _obscureTextLogin =
                                              !_obscureTextLogin;
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
                                  userController.newPassword = value;
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
                                  hintText: "New Password",
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
                                          _obscureTextLogin =
                                              !_obscureTextLogin;
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
                                  userController.confirmPassword = value;
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
                                  hintText: "Confirm New Password",
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
                                          _obscureTextLogin =
                                              !_obscureTextLogin;
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
                                    await userController.changePassword();
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
                                child: Text('Change Password',
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
        ));
  }
}
