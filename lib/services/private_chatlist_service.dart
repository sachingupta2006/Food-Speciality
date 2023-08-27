import 'dart:convert';
import 'package:foodspeciality/common%20files/global.dart';
import 'package:http/http.dart' as http;
import 'package:foodspeciality/Model/PrivateChatListModel.dart';

class ChatRoomService {
  Stream<PrivateChatListModel> getChatRoomsStream() async* {
    final apiUrl = ApiUrls.privatechatlist;
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {'x-auth-token': "$accessToken"},
      );
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        yield PrivateChatListModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load chat rooms');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
