import 'dart:convert';

import 'package:foodspeciality/Model/trendingRecipe.dart';
import 'package:get/get.dart';

import '../../../../Model/explore_model.dart';
import '../../../../Model/ongoing_challenge.dart';
import '../../../../common files/global.dart';
import 'package:http/http.dart' as http;




class ExploreController extends GetxController {

  int _sliderPage = 0;
  int get sliderPage =>  _sliderPage;
  
  bool _isLoadingExplore = true; 
  bool get isLoadingExplore => _isLoadingExplore;
  
  ExploreModel? _exploreJson;
  ExploreModel? get exploreJson => _exploreJson;

  bool _isLoadingOngoingChallenge = true; 
  bool get isLoadingOngoingChallenge => _isLoadingOngoingChallenge;
  
  OnGoingChallenges? _onGoingChallenges;
  OnGoingChallenges? get onGoingChallenges => _onGoingChallenges;

  bool _isLoadingTrending = true; 
  bool get isLoadingTrending => _isLoadingTrending;

  TrendingRecipe? _trendingRecipe;
  TrendingRecipe? get trendingRecipe => _trendingRecipe;

  final List _likeSave = [
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
    {"like": 0, "save": 0},
  ];
  List get likeSave => _likeSave;

  changeSliderPage(int index){
    _sliderPage = index;
    update();
  }

  likeMethod(int index, int like) {
    _likeSave[index]["like"] = like == 0 ? 1 : 0;
    update();
  }

  saveMethod(int index, int save) {
    _likeSave[index]["save"] = save == 0 ? 1 : 0;
    update();
  }

  getExplore() async {
    try {
      var headers = {
        'x-auth-token': accessToken!
        
        // 'x-auth-token': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjhjNzdkODRmLTQ3NTItNDg0MS05ZGIyLTY3NThiM2EwODlmMyIsImlhdCI6MTY5MTQ3OTE3MSwiZXhwIjoxNjkyMDgzOTcxfQ.5h8eA9MrZoL1UICFSolER66Iili9PB1TMcxJPNq-uQc'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getExplore));

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        _exploreJson = ExploreModel.fromJson(jsonResp);
        _isLoadingExplore = false;
        update();
      }
      else {
        print(response.reasonPhrase);
        _isLoadingExplore = false;
        update();
      }

    } catch (e) {
      print(e);
      _isLoadingExplore = false;
      update();
    }
  }

  
  getOnGoingChallenge() async {
    try {
      var request = http.Request('GET', Uri.parse(ApiUrls.getonGoingChallenge));
      request.body = '''''';

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        // _exploreJson = ExploreModel.fromJson(jsonResp);
        // _isLoadingExplore = false;
        _onGoingChallenges = OnGoingChallenges.fromJson(jsonResp);
        _isLoadingOngoingChallenge = false;
        update();
      }
      else {
        print(response.reasonPhrase);
        // _isLoadingExplore = false;
        _isLoadingOngoingChallenge = false;
        update();
      }

    } catch (e) {
      print(e);
      // _isLoadingExplore = false;
      _isLoadingOngoingChallenge = false;
      update();
    }
  }

  getTrendingRecipe() async {
    try {
      var headers = {
        'x-auth-token': accessToken!,
        'Content-Type': 'application/json'
      };
      var request = http.Request('GET', Uri.parse(ApiUrls.getTrendingRecipe));
      request.body = json.encode({
        "page": 1
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      var resp = await response.stream.bytesToString();
      var jsonResp = jsonDecode(resp);

      if (response.statusCode == 200) {
        // _onGoingChallenges = OnGoingChallenges.fromJson(jsonResp);
        // _isLoadingOngoingChallenge = false;
        _trendingRecipe = TrendingRecipe.fromJson(jsonResp);
        _isLoadingTrending = false;
        update();
      }
      else {
        print(response.reasonPhrase);
        _isLoadingTrending = false;
        update();
      }

    } catch (e) {
      print(e);
      // _isLoadingOngoingChallenge = false;
      _isLoadingTrending = false;
      update();
    }
  }


}
