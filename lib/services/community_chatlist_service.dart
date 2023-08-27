import 'dart:convert';
import 'package:foodspeciality/Model/CommunityChatListModel.dart';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;

class CommunityChatRoomService {
  Stream<CommunityChatListModel> getCommunityChatRoomsStream() async* {
    final apiUrl = ApiUrls.communitychatlist;
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'x-auth-token': "$accessToken"},
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        yield CommunityChatListModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load community chat rooms');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
