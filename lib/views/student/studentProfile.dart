// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/childController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class StudentProfile extends StatefulWidget {
  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  UserController userController = Get.find();
  GetSharedContoller getSharedContoller = Get.find();
  ChildController childController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Profile',
          isBackButton: true,
        ),
      ),
      body: Obx(
        () => userController.isLoading.value
            ? LoadingWidget()
            : getSharedContoller.roleId == "3"
                ? Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        "https://i.imgur.com/7PqjiH7.jpeg"),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name: ${userController.profileData.data!.userDetails!.guardiansName ?? ""}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Email: ${getSharedContoller.email ?? ""}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Parent of : ${childController.childInfo.data!.userDetails!.fullName ?? "N/A"}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (() {
                                  Get.toNamed(Routes.STUDENTCHANGEPASSWORD);
                                }),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: Utils.gradientBtnDecoration,
                                    child: Text(
                                      'Change Password',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Children Details",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(Icons.child_care_outlined),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Name",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                        "${childController.childInfo.data!.userDetails!.fullName ?? ""}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(Icons.class_outlined),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Class",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                        "${childController.childInfo.data!.userDetails!.className ?? ""}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(Icons.type_specimen),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Section",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                        "${childController.childInfo.data!.userDetails!.sectionName ?? ""}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(
                                    Icons.format_list_numbered_rtl_outlined),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Roll No",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                        "${childController.childInfo.data!.userDetails!.rollNo ?? ""}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(Icons.date_range_outlined),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Addmission Info: ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Flexible(
                                      child: Container(
                                        padding:
                                            new EdgeInsets.only(left: 13.0),
                                        child: Column(
                                          children: [
                                            Text(
                                                "No. : " +
                                                    "${childController.childInfo.data!.userDetails!.admissionNo!}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                )),
                                            Text(
                                                "Date: " +
                                                    "${childController.childInfo.data!.userDetails!.admissionDate!.toString().substring(0, 10)}",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        "https://i.imgur.com/7PqjiH7.jpeg"),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Name: ${userController.profileData.data!.userDetails!.fullName ?? ""}",
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Class: ${userController.profileData.data!.userDetails!.className ?? ""}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Section : ${userController.profileData.data!.userDetails!.sectionName ?? "N/A"}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Roll No : ${userController.profileData.data!.userDetails!.rollNo ?? "N/A"}",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: (() {
                                  Get.toNamed(Routes.STUDENTCHANGEPASSWORD);
                                }),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width * 0.4,
                                    decoration: Utils.gradientBtnDecoration,
                                    child: Text(
                                      'Change Password',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "My Profile Details",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(Icons.date_range_outlined),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Date Of Birth",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    // Text(
                                    //     "${userController.profileData.data!.userDetails!.dateOfBirth.toString().substring(0, 10)}",
                                    //     style: TextStyle(
                                    //       fontSize: 15,
                                    //     )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(Icons.home),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Address",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Flexible(
                                      child: Container(
                                        padding:
                                            new EdgeInsets.only(left: 13.0),
                                        child: Text(
                                            "${userController.profileData.data!.userDetails!.currentAddress ?? ""}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(Icons.email),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Email",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Text(
                                        "${userController.profileData.data!.userDetails!.email ?? ""}",
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: Icon(Icons.phone),
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Phone No: ",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Flexible(
                                      child: Container(
                                        padding:
                                            new EdgeInsets.only(left: 13.0),
                                        child: Text(
                                            "${userController.profileData.data!.userDetails!.mobile ?? ""}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Divider(
                                thickness: 1,
                              ),
                              //button to view parents details
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Parents Details",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://i.imgur.com/7PqjiH7.jpeg"),
                                ),
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Father Name",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                            "${userController.profileData.data!.userDetails!.fathersName ?? ""}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Father Phone",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                            "${userController.profileData.data!.userDetails!.fathersMobile ?? ""}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://i.imgur.com/7PqjiH7.jpeg"),
                                ),
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Mother Name",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                            "${userController.profileData.data!.userDetails!.mothersName ?? ""}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Mother Phone",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                            "${userController.profileData.data!.userDetails!.mothersMobile ?? ""}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              ListTile(
                                tileColor: Theme.of(context).primaryColor,
                                leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      "https://i.imgur.com/7PqjiH7.jpeg"),
                                ),
                                title: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Guardian Name",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                            "${userController.profileData.data!.userDetails!.guardiansName ?? ""}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Guardian Phone",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Text(
                                            "${userController.profileData.data!.userDetails!.guardiansMobile ?? ""}",
                                            style: TextStyle(
                                              fontSize: 15,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
      ),
    );
  }
}
