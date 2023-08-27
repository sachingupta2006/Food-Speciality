import 'dart:convert';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class SaveService {
  static Future saveRecipe(String recipeId) async {
    final apiUrl = ApiUrls.save;
    final body = {"recipeId": recipeId};

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        body: body,
        headers: {'x-auth-token': "$accessToken"},
      );
      print(response.body);

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // print("resp from api ${jsonResponse["message"]}");
        return jsonResponse["success"];
      } else {
        // API call failed
        throw Exception('Failed to save recipe');
      }
    } catch (e) {
      // Error occurred while making the API call
      throw Exception('Error: $e');
    }
  }
}
