import 'dart:convert';
import 'package:foodspeciality/Model/CommunityChatdetailModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

CommunityChatDetailModel? communityChatData;

class CommunityChatDetailService {
  final String apiUrl = ApiUrls.communitychatdetails;

  Future<CommunityChatDetailModel> getCommunityChatDetailData(
      String targetUserId) async {
    final body = {"communityId": targetUserId};
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'x-auth-token': "$accessToken",
        },
        body: body,
      );
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        communityChatData = CommunityChatDetailModel.fromJson(jsonResponse);
        return CommunityChatDetailModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
