import 'dart:convert';
import '../common files/global.dart';
import 'package:http/http.dart' as http;

class ReportService {
  static Future reportRecipe(String recipeId, String description) async {
    final apiUrl = ApiUrls.report;
    final body = {"recipeId": recipeId, "description": description.toString()};

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
        throw Exception('Failed to report recipe');
      }
    } catch (e) {
      // Error occurred while making the API call
      throw Exception('Error: $e');
    }
  }
}
