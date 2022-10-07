import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';

class TeacherNoticeDetailPage extends StatefulWidget {
  const TeacherNoticeDetailPage({Key? key}) : super(key: key);

  @override
  State<TeacherNoticeDetailPage> createState() =>
      _TeacherNoticeDetailPageState();
}

class _TeacherNoticeDetailPageState extends State<TeacherNoticeDetailPage> {
  var notice = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          title: 'Notice',
          isBackButton: true,
        ),
      ),
      body: Html(
        data: notice.noticeMessage,
      ),
    );
  }
}
