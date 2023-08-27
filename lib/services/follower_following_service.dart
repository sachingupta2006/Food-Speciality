import 'dart:convert';
import 'dart:developer';
import 'package:foodspeciality/Model/FollowesModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FollowerFollowing extends GetxController {
  Future<Followes> getfollowfollowing() async {
    try {
      print("getfollowfollowing g");
      http.Response response = await http.get(
        Uri.tryParse(ApiUrls.getfollowerFollowing)!,
        headers: {'x-auth-token': "$accessToken"},
      );
      print("accessToken $accessToken");
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);

        return Followes.fromJson(result);
      } else {
        throw Exception('Failed to load followers');
      }
    } catch (e) {
      log('Error while getting data: $e');
      throw Exception('Failed to load followers');
    }
  }
}
