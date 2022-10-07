import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:startupapplication/helpers/Utils.dart';

class UploadHomework extends StatefulWidget {
  final dynamic homework;
  final upDownController;

  UploadHomework({required this.homework, this.upDownController});

  @override
  _UploadHomeworkState createState() => _UploadHomeworkState();
}

class _UploadHomeworkState extends State<UploadHomework> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(0),
          child: Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Material(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          widget.upDownController.pickDocument(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.3)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: widget.upDownController.files == null
                                        ? Text('Select Homework file',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline4)
                                        : Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: List.generate(
                                                1,
                                                (index) => Text(
                                                    '$index - ${widget.upDownController.fileNames[index]}',
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline4)),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text('Browse',
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                SizedBox(
                                  width: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          if (widget.upDownController.files == null) {
                            Utils.showToast("Please select a file");
                          } else {
                            Utils.showToast("Uploading...");
                            await widget.upDownController
                                .uploadHomework(widget.homework.id);
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.07,
                          decoration: Utils.gradientBtnDecoration,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Icon(Icons.cloud_upload),
                              SizedBox(
                                width: 10,
                              ),
                              Text("Submit",
                                  style: Theme.of(context).textTheme.headline5),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => widget.upDownController.isLoading.value
                            ? LinearProgressIndicator(
                                backgroundColor: Colors.transparent,
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
