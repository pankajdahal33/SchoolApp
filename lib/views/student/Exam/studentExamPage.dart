import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/routes/app_pages.dart';
import 'package:startupapplication/views/components/SquareCardItem.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';

class StudentExamPage extends StatefulWidget {
  const StudentExamPage({Key? key}) : super(key: key);

  @override
  State<StudentExamPage> createState() => _StudentExamPageState();
}

class _StudentExamPageState extends State<StudentExamPage> {
  final buttonNames = [
    "Exam Schdeule",
    "Exam Result",
  ];

  final buttonIcons = [
    Icons.schedule,
    Icons.remove_red_eye_outlined,
  ];

  final buttonFunctions = [
    Routes.STUDENTEXAMSCHEDULE,
    Routes.STUDENTEXAMRESULT,
  ];
  int? currentCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Exam',
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
