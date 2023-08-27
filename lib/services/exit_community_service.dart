import 'dart:convert';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class ExitCommunityService {
  static Future exitCommunity(String communityId) async {
    final apiUrl = ApiUrls.exitcommunity;
    final body = {"communityId": communityId};

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: body,
        headers: {'x-auth-token': "$accessToken"},
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        print("resp from api ${jsonResponse["message"]}");
        return jsonResponse["success"];
      } else {
        // API call failed
        throw Exception('Failed to exit community');
      }
    } catch (e) {
      // Error occurred while making the API call
      throw Exception('Error: $e');
    }
  }
}
