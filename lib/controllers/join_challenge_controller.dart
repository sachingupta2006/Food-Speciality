
import 'dart:convert';

import 'package:foodspeciality/Model/challenge_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../common files/global.dart';

class JoinChallengeController extends GetxController{
  bool _isloading = true;
  bool get isloading => _isloading;

  ChallengeModel? _challengeModel;
  ChallengeModel? get challengeModel => _challengeModel;

  getChallenge({required String challengeId}) async {
    try {
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getChallengeData));
      request.body = json.encode({
        "challengeId": challengeId
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      // var headers = {
      //   'x-auth-token': accessToken!
        
      //   // 'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY5MTQ3OTE3MSwiZXhwIjoxNjkyMDgzOTcxfQ.5h8eA9MrZoL1UICFSolER66Iili9PB1TMcxJPNq-uQc'
      // };
      // var request = http.Request('GET', Uri.parse(ApiUrls.getExplore));

      // request.headers.addAll(headers);

      // http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        _challengeModel = ChallengeModel.fromJson(jsonResp);
        _isloading = false;
        update();
      }
      else {
        print(response.reasonPhrase);
        _isloading = false;
        update();
      }

    } catch (e) {
      print(e);
      _isloading = false;
      update();
    }
  }

  
}