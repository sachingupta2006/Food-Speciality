import 'dart:convert';
import 'package:foodspeciality/Model/BlocklistModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class BlocklistService {
  final String apiUrl = ApiUrls.blocklist;

  Future<BlocklistModel> getBlocklistData() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          // Add your authentication token here
          'x-auth-token': "$accessToken",
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return BlocklistModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
