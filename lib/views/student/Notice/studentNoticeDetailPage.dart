import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:startupapplication/views/components/custom_appBar.dart';

class StudentNoticeDetailPage extends StatefulWidget {
  const StudentNoticeDetailPage({Key? key}) : super(key: key);

  @override
  State<StudentNoticeDetailPage> createState() =>
      _StudentNoticeDetailPageState();
}

class _StudentNoticeDetailPageState extends State<StudentNoticeDetailPage> {
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
