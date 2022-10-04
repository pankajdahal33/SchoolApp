// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/getSharedData.dart';

class StudentProfile extends StatelessWidget {
  GetSharedContoller getSharedContoller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text(" Profile"),
        centerTitle: true,
      ),
      body: getSharedContoller.roleId == "3"
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name: ${getSharedContoller.fullName ?? ""}",
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
                                  "Parent of : ${getSharedContoller.childName ?? "N/A"}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Name",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("${getSharedContoller.childName ?? ""}",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Class",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("${getSharedContoller.childClass ?? ""}",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Section",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("${getSharedContoller.childSection ?? ""}",
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
                          leading:
                              Icon(Icons.format_list_numbered_rtl_outlined),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Roll No",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("${getSharedContoller.childRollNo ?? ""}",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Date Of Birth: ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Flexible(
                                child: Container(
                                  padding: new EdgeInsets.only(left: 13.0),
                                  child: Text(
                                      "${getSharedContoller.childDOB ?? ""}",
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
                          leading: Icon(Icons.home),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(" Address: ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Flexible(
                                child: Container(
                                  padding: new EdgeInsets.only(left: 13.0),
                                  child: Text(
                                      "${getSharedContoller.childAddress ?? ""}",
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
                            leading: Icon(Icons.bloodtype),
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Blood Group: ",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Flexible(
                                  child: Container(
                                    padding: new EdgeInsets.only(left: 13.0),
                                    child: Text(
                                        "${getSharedContoller.childBloodGroup ?? ""}",
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15,
                                        )),
                                  ),
                                ),
                              ],
                            )),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name: ${getSharedContoller.fullName ?? ""}",
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Class: ${getSharedContoller.className ?? ""}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Section : ${getSharedContoller.sectionName ?? "N/A"}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "Roll No : ${getSharedContoller.rollNo ?? "N/A"}",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Date Of Birth",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("${getSharedContoller.dateOfBirth ?? ""}",
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
                          leading: Icon(Icons.home),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Address",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Flexible(
                                child: Container(
                                  padding: new EdgeInsets.only(left: 13.0),
                                  child: Text(
                                      "${getSharedContoller.currentAddress ?? ""}",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Email",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text("${getSharedContoller.email ?? ""}",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Phone No: ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Flexible(
                                child: Container(
                                  padding: new EdgeInsets.only(left: 13.0),
                                  child:
                                      Text("${getSharedContoller.mobile ?? ""}",
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
                          leading: Icon(Icons.bloodtype),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Blood Group: ",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Flexible(
                                child: Container(
                                  padding: new EdgeInsets.only(left: 13.0),
                                  child: Text(
                                      "${getSharedContoller.bloodGroup ?? ""}",
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
                                  Text("${getSharedContoller.fatherName ?? ""}",
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
                                      "${getSharedContoller.fatherPhone ?? ""}",
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
                                  Text("${getSharedContoller.motherName ?? ""}",
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
                                      "${getSharedContoller.motherPhone ?? ""}",
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
                                      "${getSharedContoller.guardianName ?? ""}",
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
                                      "${getSharedContoller.guardianPhone ?? ""}",
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
    );
  }
}
