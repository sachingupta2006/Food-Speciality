import 'dart:convert';
import 'package:foodspeciality/Model/PrivateChatDetailModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

PrivateChatDetailModel? chatData;

class PrivateChatDetailService {
  final String apiUrl = ApiUrls.privatechatdetails;

  Future<PrivateChatDetailModel> getPrivateChatDetailData(
      String targetUserId) async {
    final body = {"userid": targetUserId};
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
        chatData = PrivateChatDetailModel.fromJson(jsonResponse);
        return PrivateChatDetailModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
