// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/classController.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/SquareCardItem.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';

class TeacherAttendance extends StatefulWidget {
  TeacherAttendance({Key? key}) : super(key: key);

  @override
  State<TeacherAttendance> createState() => _TeacherAttendanceState();
}

class _TeacherAttendanceState extends State<TeacherAttendance> {
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
  int? currentCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Attendance',
          isBackButton: true,
        ),
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
                  isSelected: currentCard == index ? true : false,
                  name: buttonNames[index],
                  icon: Icon(buttonIcons[index]),
                  onTap: (() async {
                    setState(() {
                      currentCard = index;
                    });
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
