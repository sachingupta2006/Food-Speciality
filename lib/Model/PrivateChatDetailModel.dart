class PrivateChatDetailModel {
  bool? success;
  List<Data>? data;

  PrivateChatDetailModel({this.success, this.data});

  PrivateChatDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? message;
  String? userId;
  String? communityId;
  String? senderId;
  String? createdAt;

  Data(
      {this.id,
      this.message,
      this.userId,
      this.communityId,
      this.senderId,
      this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    userId = json['userId'];
    communityId = json['communityId'];
    senderId = json['senderId'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['userId'] = this.userId;
    data['communityId'] = this.communityId;
    data['senderId'] = this.senderId;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
