// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// void httpErrorHandle({
//   required StreamedResponse response,
//   required VoidCallback onSuccess,
// }) {
//   switch (response.statusCode) {
//     case 200:
//       onSuccess();
//       break;
//     case 400:
//       Get.snackbar("Error", jsonDecode(response.body)['data']["message"]);
//       break;
//     default:
//       Get.snackbar("Error", response.body);
//   }
// }
