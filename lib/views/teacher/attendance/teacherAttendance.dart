// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/classController.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/SquareCardItem.dart';

class TeacherAttendance extends StatelessWidget {
  TeacherAttendance({Key? key}) : super(key: key);
  ClassController classController = Get.find();

  final buttonNames = [
    "Class Attendance",
    "View Attendance",
  ];
  final buttonIcons = [
    Icons.fingerprint,
    Icons.remove_red_eye_outlined,
  ];
  final buttonFunctions = [
    Routes.CLASSATTENDANCE,
    Routes.SEARCHATTENDANCE,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text('Teacher Attendance'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: GridView.builder(
              itemCount: buttonIcons.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return CardWidget(
                  name: buttonNames[index],
                  icon: Icon(buttonIcons[index]),
                  onTap: (() async {
                    Get.toNamed(buttonFunctions[index]);
                    await classController.getClassStudents();
                  }),
                );
              }),
        ),
      ),
    );
  }
}
