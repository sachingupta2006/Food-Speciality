import 'dart:convert';
import 'package:foodspeciality/Model/AboutUsModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class AboutUsService {
  final String apiUrl = ApiUrls
      .getabout; // Replace with the actual API URL for the "About Us" data

  Future<AboutUsModel> getAboutUsData() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        return AboutUsModel.fromJson(jsonResponse);
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
