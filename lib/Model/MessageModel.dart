class MessageModel {
  String? type;
  String? message;

  MessageModel({this.message, this.type});
}

class CommunityMessageModel {
  String? type;
  String? message;
  dynamic image;

  CommunityMessageModel({this.message, this.type, this.image});
}
