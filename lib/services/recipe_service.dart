import 'dart:convert';
import 'dart:io';

import 'package:foodspeciality/api_common/response_handling.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_common/network_api.dart';
import '../common files/global.dart';
import '../constants/base_manager.dart';
import 'package:http/http.dart' as http;

import '../controllers/recipe_ingre_controller.dart';

class RecipeService {

  RecipeIngreController recipeIngreController = Get.put(RecipeIngreController());

  Future<ResponseData<dynamic>> addRecipe({
    required String videoPath,
    required String imagePath,
    required String name,
    required String description,
    required String difficulty,
    required String cookingTime,
    required String serving,
    required String tags,
    required String ingredients,
    required String instructions,
    required String publish_status,
    required List<File?> instructionsImages,
    String? challengeId
  }) async {
    print("addRecipe");
    print("imagePath- $imagePath");
    print("instructionsImages $instructionsImages");
    
    try {
      var headers = {
        'x-auth-token': accessToken!

        // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY4OTYwNzYwNSwiZXhwIjoxNjkwMjEyNDA1fQ.Y1yxVdWNoSMNv9Q-i2_p3LtUkwZWx4qkAeKTIvBWPwc'
      };
      var request = http.MultipartRequest('POST', Uri.parse(ApiUrls.addRecipe));
      var other = {
        'name': name,
        'description': description,
        'difficulty': difficulty,
        'cooking_time': cookingTime,
        'servings': serving,
        'tags': tags,
        'ingredients': ingredients,
        'instructions': instructions,

        'published_status': publish_status,
        'challengeId': challengeId??""
      };
      request.fields.addAll(other);
      print({
        'name': name,
        'description': description,
        'difficulty': difficulty,
        'cooking_time': cookingTime,
        'servings': serving,
        'tags': tags,
        'ingredients': ingredients,

        // 'ingredients': '[{"name": "rice", "quantity": "1cup"}]',
        'instructions': instructions,
        'published_status': publish_status
      });
      request.files.add(await http.MultipartFile.fromPath('video', videoPath));
      request.files.add(await http.MultipartFile.fromPath('cover_image', imagePath));
      // request.files.add(await http.MultipartFile.fromPath('inCover_image', imagePath));
      for (var i = 0; i < instructionsImages.length; i++) {
        request.files.add(await http.MultipartFile.fromPath('inCover_image', instructionsImages[i]!.path));
      }
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      // return responseHandling(response: response);


      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // //   return ResponseData<dynamic>(
      // //   // jsonResp["message"],
      // //   // e.toString(),
      // //   "fgh",
      // //   ResponseStatus.FAILED,
      // // );
      // }
      // else {
      //   print(response.reasonPhrase);
      //   // return ResponseData<dynamic>(
      //   // // jsonResp["message"],
      //   // // e.toString(),
      //   // "fgh",
      //   // ResponseStatus.FAILED,
      //   // );
      // }
      
      return responseHandling(response: response);


      
      // old
      // /

      // var headers = {
      //   'x-auth-token': 
      //   // accessToken!
      //   'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY4OTYwNzYwNSwiZXhwIjoxNjkwMjEyNDA1fQ.Y1yxVdWNoSMNv9Q-i2_p3LtUkwZWx4qkAeKTIvBWPwc'
      // };
      // var request = http.MultipartRequest('POST', Uri.parse(ApiUrls.addRecipe));
      // request.fields.addAll({
      //   'name': name,
      //   'description': description,
      //   'difficulty': difficulty,
      //   'cooking_time': cookingTime,
      //   'servings': serving,
      //   'tags': tags,
      //   'ingredients': ingredients,
      //   'instructions': instructions,

      //   'publish_status': 'draft'
      // });
      // // print({
      // //   'name': name,
      // //   'description': description,
      // //   'difficulty': "easy",
      // //   'cooking_time': cookingTime,
      // //   'servings': serving,
      // //   'tags': tags,
      // //   'ingredients': ingredients,
      // //   'instructions': ["one","two"].toString(),
      // //   'publish_status': 'draft',
      // //   'instructions': ["fg"].toString(),
      // //   'publish_status': publish_status

      // //   // if(){
      // //   //   'instruction_name': 'vbh',
      // //   // }
        
        
      // //   // '[{"name": "rice", "quantity": "1 cup"}, {"name": "chicken", "quantity": "100 gm"}]'
      // // });
      // // ["1", "2"].map((e) => {
      // // request.fields.addAll({
      // //   "ingredient_name": e
      // // })
      // // });
      // // print({
      // //   'name': name,
      // //   'description': description,
      // //   'difficulty': difficulty,
      // //   'cooking_time': cookingTime,
      // //   'servings': serving,
      // //   'tags': tags,
      // //   'ingredients': ingredients,
      // //   'instructions': ["two"].toString(),
      // //   'publish_status': 'draft'

      // //   // if(){
      // //   //   'instruction_name': 'vbh',
      // //   // }
        
        
      // //   // '[{"name": "rice", "quantity": "1 cup"}, {"name": "chicken", "quantity": "100 gm"}]'
      // // });
      // request.files.add(await http.MultipartFile.fromPath('video', videoPath));
      // request.files.add(await http.MultipartFile.fromPath('cover_image', imagePath));
      // // for (var i = 0; i < 2; i++) {
      // request.files.add(await http.MultipartFile.fromPath('inCover_image', imagePath));
        
      // // }
      // // if (condition) {
        
      // // }
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      // return responseHandling(response: response);

      // var resp = await response.stream.bytesToString();
      // print(resp);
      // var jsonResp = jsonDecode(resp);
      // print(resp.sta)
      // if (response.statusCode == 200) {
      //   print(await response.stream.bytesToString());
      // }
      // else {
      //   print(response.reasonPhrase);
      // }


      // var headers = {
      //   'Content-Type': 'application/json'
      // };
      // var request = http.Request('POST', Uri.parse(ApiUrls.login));
      // request.body = json.encode({
      //   "email": email,
      //   "password": password
      // });
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      // var resp = await response.stream.bytesToString();
      // print(resp);
      // var jsonResp = jsonDecode(resp);
      // if (response.statusCode == 200) {
      //   return ResponseData<dynamic>(
      //     "success",
      //     ResponseStatus.SUCCESS,
      //   );
      //   // SharedPreferences prefs = await SharedPreferences.getInstance();
      //   // print("token " + jsonResp["data"]["accessToken"]);
      //   // await prefs.setString('accessToken', jsonResp["data"]["accessToken"]);
      //   // await prefs.setString('refreshToken', jsonResp["data"]["refreshToken"]);

      //   // // print(await response.stream.bytesToString());
      //   // Get.toNamed("/bottomBar");

      // } else if(response.statusCode == 400) {
      //   return ResponseData<dynamic>(
      //   jsonResp["message"],
      //     ResponseStatus.FAILED,
      //   );
      //   // Get.snackbar("Error", jsonResp["data"]["message"]);
      // }
      // else {
      //   return ResponseData<dynamic>(
      //     jsonResp["message"],
      //     ResponseStatus.FAILED,
      //   );
      //   // Get.snackbar("Error", response.reasonPhrase!);

      //   // print(response.reasonPhrase);
      // }

    } catch (e) {
      // Get.
      Get.snackbar("Error", e.toString());
      return ResponseData<dynamic>(
        // jsonResp["message"],
        e.toString(),
        ResponseStatus.FAILED,
      );
      // Get.snackbar("Error", e.toString());
    }
  }

}