import 'dart:convert';
import 'package:foodspeciality/Model/RecipeModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

RecipeModel? receipeModelvar;

class GetRecipeService {
  final String apiUrl = ApiUrls.getrecipe;

  Future<RecipeModel> getRecipeData() async {
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'x-auth-token': '$accessToken', // Replace with your actual auth token
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        receipeModelvar = RecipeModel.fromJson(jsonResponse);
        print(
            "resp from api about liked ${receipeModelvar!.data!.first.liked}");
        return receipeModelvar!;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
