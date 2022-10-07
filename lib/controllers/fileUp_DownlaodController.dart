import 'dart:io';

import 'package:dio/dio.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:startupapplication/controllers/ApiBaseController/apiRequestController.dart';
import 'package:startupapplication/controllers/getSharedData.dart';
import 'package:startupapplication/helpers/Utils.dart';
import 'package:dio/src/multipart_file.dart' as multipart;
import 'package:dio/src/form_data.dart' as formdata;

class UpDownlaodController extends GetxController {
  GetSharedContoller getSharedController = Get.find();
  var received;
  var download = "";
  var isLoading = false.obs;

  List<File>? files;
  List<String> fileNames = [];

  downloadFile(
      String fileName, BuildContext context, String subjectName) async {
    Dio dio = Dio();

    String dirloc = "";
    if (Platform.isAndroid) {
      dirloc = "/sdcard/download/";
    } else {
      dirloc = (await getApplicationDocumentsDirectory()).path;
    }

    try {
      Utils.showToast("Downloading...");

      received = await dio.download(
        ApiRequestController.baseUrl + fileName,
        "$dirloc/$fileName",
        onReceiveProgress: (receivedBytes, totalBytes) {
          if (totalBytes != -1) {
            download =
                ((receivedBytes / totalBytes * 100).toStringAsFixed(0) + "%");
            print((receivedBytes / totalBytes * 100).toStringAsFixed(0) + "%");
          }
        },
        //open the downloaded file after download
      );
      if (received.statusCode == 200) {
        Utils.showToast(
            "Download Completed. File is also available in your download folder.");
        OpenFile.open("$dirloc/$fileName");
        Get.back();
      } else {
        Utils.showToast("Download Failed. Please try again later.");
      }
    } catch (e) {
      print(e);
    }
  }

  Future pickDocument(context) async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: true, type: FileType.image);
    print(result);
    if (result != null) {
      files = result.paths.map((path) => File(path!)).toList();
      files!.forEach((element) {
        fileNames.add(element.path.toString().split('/').last);
      });
    } else {
      Utils.showToast('Cancelled picking docuement');
    }
  }

  uploadHomework(homeworkId) async {
    var res;
    if (files != null) {
      List<multipart.MultipartFile>? multipartFiles = [];
      for (int i = 0; i < files!.length; i++) {
        multipartFiles.add(await multipart.MultipartFile.fromFile(
            files![i].path,
            filename: files![i].path));
      }
      formdata.FormData formData = formdata.FormData.fromMap({
        "user_id": getSharedController.userId,
        "homework_id": homeworkId,
        'files[]': multipartFiles,
      });
      isLoading(true);

      Dio dio = Dio();
      var endpoint =
          ApiRequestController.apiBaseUrl + "student-upload-homework";
      try {
        res = await dio.post(
          endpoint,
          data: formData,
          options: Options(
            headers: {
              "Accept": "application/json",
              "Authorization": getSharedController.token,
            },
          ),
          onSendProgress: (received, total) {
            if (total != -1) {
              print((received / total * 100).toStringAsFixed(0) + '%');
            }
          },
        ).catchError((e) {
          Utils.showToast(e.message);
          Get.back();
        });
        print(res.data);
        if (res.statusCode == 200) {
          Utils.showToast("File Uploaded Successfully");
          isLoading(false);
          Get.back();
        } else {
          Utils.showToast("File Upload Failed");
          isLoading(false);
        }
      } catch (e) {
        print(e);
        isLoading(false);
      }
    }
  }
}
