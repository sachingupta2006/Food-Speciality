import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:foodspeciality/Model/RecipeModel.dart';
import 'package:foodspeciality/Model/Replies.dart';
import 'package:foodspeciality/Model/comments_model.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

// Comments? comments;

class GetCommentsController extends GetxController {
  // final String apiUrl = ApiUrls.getrecipe;

  Comments? _comments;
  Comments? get comments => _comments;

  emptyComments(){
    _comments = null;
  }

  Future<Comments> getCommentsData(String recipeId) async {
    try {
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getComments));
      request.body = json.encode({
        "recipeId": recipeId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      var resp = await response.stream.bytesToString();


      if (response.statusCode == 200) {
        final jsonResponse = json.decode(resp);

        _comments = Comments.fromJson(jsonResponse);
        update();
        return comments!;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<bool?> addCommentApi({required String commment, required String recipeId}) async {
    try {
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(ApiUrls.addComments));
      request.body = json.encode({
        "comment": commment,
        "recipeId": recipeId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        getCommentsData(recipeId);
        return true;
      }
      else {
        print(response.reasonPhrase);
        Get.snackbar("Error", "Something went wrong");
      }
    } catch (e) {
      // Get.snackbar("Error", e.toString());
      Get.snackbar("Error", "Something went wrong");

    }
  }

  likeCommentApi({required String commentId, required String recipeId}) async {
    try {
      print(likeCommentApi);
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(ApiUrls.likeComment));
      request.body = json.encode({
        "commentId": commentId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        getCommentsData(recipeId);

      }
      else {
        // print(response.reasonPhrase);
        // Get.snackbar("Error", response.reasonPhrase.toString());
        Get.snackbar("Error", "Something went wrong");

      }

    } catch (e) {
      // Get.snackbar("Error", e.toString());
      Get.snackbar("Error", "Something went wrong");

    }
  }

  

  Future<Replies> getReplies({required String commentId}) async {
    try {
      print("getReplies");
      var headers = {
        'x-auth-token': accessToken!,

        // 'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY5MTA3MTk5NywiZXhwIjoxNjkxNjc2Nzk3fQ.bSHK-qQpKZ3s77DgKSovLZs1YdqW3NQtA6H7yeelKws',
        'Content-Type': 'application/json'
      };
      var data = json.encode({
        "commentId": commentId

        // "commentId": "a462b3cc-d444-4fcb-8f2a-0973ca0c7e53"
      });
      var dio = Dio();
      var response = await dio.request(
        ApiUrls.commentReplies,
        options: Options(
          method: 'GET',
          headers: headers,
        ),
        data: data,
      );
      print(response.data);

      if (response.statusCode == 200) {
        // print(json.encode(response.data));
        var resp = json.encode(response.data);
        var result = jsonDecode(resp);
        var replies = Replies.fromJson(result);
        return replies;
      }
      else {
        // print(response.statusMessage);
        throw Exception('Failed to load replies');

      }
      // print("getReplies");
      // print(commentId);
      // // http.Response response = await http.get(
      // //   Uri.tryParse(ApiUrls.getfollowerFollowing)!,
      // //   headers: {'x-auth-token': "$accessToken"},
      // // );
      // var headers = {
      //   'x-auth-token': accessToken!,
      //   // 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY5MTA3MTk5NywiZXhwIjoxNjkxNjc2Nzk3fQ.bSHK-qQpKZ3s77DgKSovLZs1YdqW3NQtA6H7yeelKws',
      //   'Content-Type': 'application/json'
      // };
      // print(accessToken);
      // var request = http.Request('GET', Uri.parse(ApiUrls.commentReplies));
      // request.body = json.encode({
      //   "commentId": commentId
      //   // "6f49806a-4072-4070-8b67-0b9a14d6e32a"
      // });
      // request.headers.addAll(headers);

      // // http.Response response = await request.send();

      // http.StreamedResponse response = await request.send();

      // // if (response.statusCode == 200) {
      // //   print(await response.stream.bytesToString());
      // // }
      // // else {
      // //   print(response.reasonPhrase);
      // // }
      // print(response.statusCode);
      // // print(response);
      // // print(object)

      // if (response.statusCode == 200) {
      //   var resData = await response.stream.bytesToString();
      //   print(resData);
      //   var result = jsonDecode(resData);
      //   var repliesData = Replies.fromJson(result);
      //   return repliesData;
      // } else {
      //   throw Exception('Failed to load replies');
      // }
    } catch (e) {
      log('Error while getting data: $e');
      throw Exception('Failed to load replies');
    }
  }

  Future<bool?> addReplyApi({required String reply, required String commentId, required String recipeId}) async {
    try {
      print(addReplyApi);
      var headers = {
        'x-auth-token': accessToken!,
        // 'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY5MTQ3OTE3MSwiZXhwIjoxNjkyMDgzOTcxfQ.5h8eA9MrZoL1UICFSolER66Iili9PB1TMcxJPNq-uQc',
        'Content-Type': 'application/json'
      };
      var request = http.Request('POST', Uri.parse(ApiUrls.addReply));
      request.body = json.encode({
        "reply": reply,
        "commentId": commentId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // var headers = {
      //   'x-auth-token': accessToken!,
      //   'Content-Type': 'application/json'
      // };
      // var request = http.Request('POST', Uri.parse(ApiUrls.addComments));
      // request.body = json.encode({
      //   "comment": commment,
      //   "recipeId": recipeId
      // });
      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
        getCommentsData(recipeId);
        return true;
      }
      else {
        print(response.reasonPhrase);
        Get.snackbar("Error", "Something went wrong");
      }
    } catch (e) {
      // Get.snackbar("Error", e.toString());
      Get.snackbar("Error", "Something went wrong");

    }
  }


}
