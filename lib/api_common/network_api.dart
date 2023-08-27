import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'base_manager.dart';

import 'package:http/http.dart' as http;

import '../constants/base_manager.dart';

class NetworkApi {
  Future<ResponseData<dynamic>> postApiHttp(
      String token, String url, Map<String, String> body) async {
    var headers = {
      'Authorization': 'Bearer $token',
      // 'Cookie': 'laravel_session=eyJpdiI6ImcwS2NYNlJYam4wcU1YUXJsYWZsb2c9PSIsInZhbHVlIjoiK0hvT3c5NmZFQ0NDajYxTUFaaVluWkpYbUkwYk1JbldyTVJwZitMN05zWnliaVdBNWZjTXpyVG5UODM1MTBaMzQwUCtNc3lGak5MQWRZamh2dWIvdzIxQnNVVWQrQi9NUi9YTS9PQWgxMlZHTENUNU0zY0VVazluNEplTFFvbGgiLCJtYWMiOiJkNjA0NjA4YWJhZDkxODA0YmQ2MTViNzc1MTg4OWRiODMzMjI5OGE0ZDI3MDRhMTAzM2E1MGY4ODQyMjI1NGIxIiwidGFnIjoiIn0%3D'
    };
    var request = http.MultipartRequest('POST', Uri.parse(url));

    request.fields.addAll(body);

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      return ResponseData<dynamic>(
        "success",
        ResponseStatus.SUCCESS,
      );
      // return await response.stream.bytesToString();
    } else if (response.statusCode == 400) {
      var resp = await response.stream.bytesToString();
      var jsonResp = jsonDecode(resp);
      print(jsonResp);
      return ResponseData<dynamic>(
        jsonResp["message"],
        ResponseStatus.FAILED,
      );
    } else if (response.statusCode == 500) {
      var resp = await response.stream.bytesToString();
      var jsonResp = jsonDecode(resp);
      print(jsonResp);
      return ResponseData<dynamic>(
        jsonResp["message"],
        ResponseStatus.FAILED,
      );
    } else {
      return ResponseData<dynamic>(
        response.reasonPhrase!,
        ResponseStatus.FAILED,
      );
    }
  }
}
