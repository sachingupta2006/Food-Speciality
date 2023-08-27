
import 'dart:convert';
import 'dart:io';

import 'package:foodspeciality/Model/user_data.dart';
import 'package:foodspeciality/Model/user_saved.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/user_recipes.dart';
import '../api_common/response_handling.dart';
import '../common files/global.dart';
import 'package:http/http.dart' as http;
import '../constants/base_manager.dart';

class UserDataController extends GetxController{
  UserData? _userData;
  UserData? get userData => _userData;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  UserSaved? _userSaved;
  UserSaved? get userSaved => _userSaved;

  bool _isLoadingSaved = true;
  bool get isLoadingSaved => _isLoadingSaved;

  UserRecipes? _userRecipes;
  UserRecipes? get userRecipes => _userRecipes;
  

  bool _isLoadingUserRecipe = true;
  bool get isLoadingUserRecipe => _isLoadingUserRecipe;
  

  getUserProfile() async {
    try {
      print("getUserProfile");
      var headers = {
        'x-auth-token': accessToken!
        // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY4OTkzOTcxNCwiZXhwIjoxNjkwNTQ0NTE0fQ.T_WbFlhU9tXIoIofyiqzAcyo8tqwyHpuGyl1RpoJq_Y'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getProfileData));
      request.body = '''''';
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      // print(resp);
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        _userData = UserData.fromJson(jsonResp);
        _isLoading = false;
        update();
        print(_userData);
      }
      else {
        print(response.reasonPhrase);
      }

      

    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
  
  getUserSaved() async {
    try {
      print("getUserSaved");
      var headers = {
        'x-auth-token': accessToken!

        // 'x-auth-token': 'yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY5MTQ3OTE3MSwiZXhwIjoxNjkyMDgzOTcxfQ.5h8eA9MrZoL1UICFSolER66Iili9PB1TMcxJPNq-uQc'
      };
      var request = http.MultipartRequest('GET', Uri.parse(ApiUrls.savedRecipes));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      // print(resp);
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        // _userData = UserData.fromJson(jsonResp);
        _userSaved = UserSaved.fromJson(jsonResp);
        _isLoadingSaved = false;
        update();
        // print(_userData);
      }
      else {
        print(response.reasonPhrase);
        _isLoadingSaved = false;
        update();

      }

      

    } catch (e) {
      Get.snackbar("Error", e.toString());
      _isLoadingSaved = false;
      update();
    }
  }
  
  getUserRecipe() async {
    try {
      print("getUserSaved");
      var headers = {
        'x-auth-token': accessToken!

        // 'x-auth-token': 'yJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY5MTQ3OTE3MSwiZXhwIjoxNjkyMDgzOTcxfQ.5h8eA9MrZoL1UICFSolER66Iili9PB1TMcxJPNq-uQc'
      };
      var request = http.MultipartRequest('GET', Uri.parse(ApiUrls.userRecipes));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      // print(resp);
      var jsonResp = jsonDecode(resp);
      

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        // _userData = UserData.fromJson(jsonResp);
        // _userSaved = UserSaved.fromJson(jsonResp);
        _userRecipes = UserRecipes.fromJson(jsonResp);
        _isLoadingUserRecipe = false;
        update();
        // print(_userData);
      }
      else {
        print(response.reasonPhrase);
        _isLoadingUserRecipe = false;
        update();

      }

      

    } catch (e) {
      // Get.snackbar("Error", e.toString());
      _isLoadingUserRecipe = false;
      update();
    }
  }
  
}