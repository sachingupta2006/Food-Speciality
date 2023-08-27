import 'dart:convert';
import 'package:foodspeciality/Model/CommunityGuidelinesModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class CommunityGuidelinesService {
  final String apiUrl = ApiUrls.getcommunityguidelines;

  Future<CommunityGuidelinesModel> getCommunityGuidelines() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return CommunityGuidelinesModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
