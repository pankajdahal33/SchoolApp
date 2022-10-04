import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/controllers/childController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/controllers/userController.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:startupapplication/views/components/loadingWidget.dart';

class SelectChildPage extends StatefulWidget {
  const SelectChildPage({Key? key}) : super(key: key);

  @override
  State<SelectChildPage> createState() => _SelectChildPageState();
}

class _SelectChildPageState extends State<SelectChildPage> {
  GetSharedContoller getSharedContoller = Get.find();
  ChildController childController = Get.find();
  UserController userController = Get.find();
  Future<bool> _willPopCallback() async {
    showExitDialog(context);
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          leading: Container(),
          title: const Text('Select Child'),
          actions: [
            IconButton(
              onPressed: () async {
                userController.logout();
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        body: Center(
          child: Obx(
            () => childController.isLoading.value
                ? LoadingWidget()
                : ListView.builder(
                    itemCount: childController.childList.data!.length,
                    itemBuilder: (context, index) {
                      return ElevatedButton(
                        child: Row(
                          children: [
                            CircleAvatar(
                              minRadius: 40,
                              backgroundImage: NetworkImage(
                                "https://i.imgur.com/7PqjiH7.jpeg",
                                scale: 0.5,
                              ),
                            ),
                            Column(
                              children: [
                                Text(
                                  'Name: ${childController.childList.data![index].studentName}',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  'Class: ${childController.childList.data![index].className}',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  'Section: ${childController.childList.data![index].sectionName}',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Text(
                                  'Roll No.: ${childController.childList.data![index].rollNo}',
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ],
                            ),
                          ],
                        ),
                        onPressed: () async {
                          Utils.saveStringValue(
                              'childId',
                              childController.childList.data![index].userId
                                  .toString());
                          await getSharedContoller.sharedPreferenceData();
                          await childController.getChildInfo(childController
                              .childList.data![index].userId
                              .toString());
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(29, 105, 90, 107),
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold)),
                      );
                    },
                  ),
          ),
        ),
      ),
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
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            Get.back();
                            //Navigator.of(context).pop();
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              "   No   ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          color: Theme.of(context).backgroundColor,
                          onPressed: () {
                            if (Get.isDialogOpen!) Get.back();
                            exit(0);
                          },
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              " YES ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
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
