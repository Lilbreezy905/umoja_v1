// import 'dart:io';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:permission_handler/permission_handler.dart';

// class DownloadFile {
//   late String _localPath;
//   late bool _permissionReady;
//   late TargetPlatform? platform=TargetPlatform.android;

//   TargetPlatform platforme() {
//     TargetPlatform? platform;
//     if (Platform.isAndroid) {
//       platform = TargetPlatform.android;
//     } else {
//       platform = TargetPlatform.iOS;
//     }
//     return platform;
//   }

//   // ignore: unused_element
//   Future<bool> _checkPermission() async {
//     if (platform == TargetPlatform.android) {
//       final status = await Permission.storage.status;
//       if (status != PermissionStatus.granted) {
//         final result = await Permission.storage.request();
//         if (result == PermissionStatus.granted) {
//           return true;
//         }
//       } else {
//         return true;
//       }
//     } else {
//       return true;
//     }
//     return false;
//   }

//   // ignore: unused_element
//   Future<void> _prepareSaveDir() async {
//     _localPath = (await _findLocalPath())!;

//     print(_localPath);
//     final savedDir = Directory(_localPath);
//     bool hasExisted = await savedDir.exists();
//     if (!hasExisted) {
//       savedDir.create();
//     }
//   }

//   Future<String?> _findLocalPath() async {
//     if (platform == TargetPlatform.android) {
//       return "/sdcard/download/";
//     } else {
//       var directory = await getApplicationDocumentsDirectory();
//       return '${directory.path}${Platform.pathSeparator}Download';
//     }
//   }

//   void dioDownload(String url, String fileName) async {
//     String downloadMessage = "Downloading...";
//     _permissionReady = await _checkPermission();
//     if (_permissionReady) {
//       await _prepareSaveDir();
//       // ignore: avoid_print
//       print("Downloading");
//       try {
//         await Dio().download(
//           url,
//           "$_localPath/ $fileName",
//           onReceiveProgress: (count, total) {
//             var parcentage = count / total * 100;
//             downloadMessage = parcentage.toString();
//             parcentage<100? LinearPercentIndicator(
//               percent: parcentage/100,
//               alignment: MainAxisAlignment.start,
//               trailing:  Text("${parcentage.floor()}%"),
//             ):Container();
//           },
//         );
//          Get.snackbar("Downlod task", "download complete");
//       } catch (e) {
//         Get.snackbar("Error while downloading file", e.toString());
//       }
//     }
//   }
// }
