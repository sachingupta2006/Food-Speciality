import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart';
import '../constants/base_manager.dart';

Future<ResponseData<dynamic>> responseHandling({
  required StreamedResponse response,
  // required VoidCallback onSuccess,
}) async {
  var resp = await response.stream.bytesToString();
  // print(resp);
  var jsonResp = jsonDecode(resp);
  print(response.statusCode);
  print(jsonResp);

  switch (response.statusCode) {
    case 200:
      // onSuccess();
      // return
      return ResponseData<dynamic>(
        // "success",
        jsonResp["message"],
        ResponseStatus.SUCCESS,
      );

    // break;

    case 403:
      return ResponseData<dynamic>(
        "UnAuthorized",
        ResponseStatus.PRIVATE,
        // data:
      );
    // break;
    case 400:
      // Get.showSnackbar(snackbar)

      Get.snackbar("Error", jsonResp["data"]["message"]);

      Get.snackbar("Error", jsonResp["message"]);

      return ResponseData<dynamic>(
        "UnAuthorized",
        ResponseStatus.FAILED,
        // data:
      );
    // break;
    default:
      // ret
      return ResponseData<dynamic>(
        "Default",
        ResponseStatus.FAILED,
        // data:
      );
  }
}
