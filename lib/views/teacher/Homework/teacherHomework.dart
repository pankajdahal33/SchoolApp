// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/SquareCardItem.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';

class TeacherHomework extends StatefulWidget {
  TeacherHomework({Key? key}) : super(key: key);

  @override
  State<TeacherHomework> createState() => _TeacherHomeworkState();
}

class _TeacherHomeworkState extends State<TeacherHomework> {
  final buttonNames = [
    "Add Homework",
    "View Homework",
  ];

  final buttonIcons = [
    Icons.add,
    Icons.remove_red_eye_outlined,
  ];

  final buttonFunctions = [
    Routes.ADDHOMEWORK,
    Routes.HOMEWORKLIST,
  ];
  int? currentCard;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Homework',
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
                  }),
                );
              }),
        ),
      ),
    );
  }
}
