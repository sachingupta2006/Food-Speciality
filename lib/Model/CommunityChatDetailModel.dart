class CommunityChatDetailModel {
  bool? success;
  List<Data>? data;

  CommunityChatDetailModel({this.success, this.data});

  CommunityChatDetailModel.fromJson(Map<String, dynamic> json) {
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
  Sender? sender;

  Data(
      {this.id,
      this.message,
      this.userId,
      this.communityId,
      this.senderId,
      this.createdAt,
      this.sender});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    userId = json['userId'];
    communityId = json['communityId'];
    senderId = json['senderId'];
    createdAt = json['createdAt'];
    sender =
        json['sender'] != null ? new Sender.fromJson(json['sender']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['userId'] = this.userId;
    data['communityId'] = this.communityId;
    data['senderId'] = this.senderId;
    data['createdAt'] = this.createdAt;
    if (this.sender != null) {
      data['sender'] = this.sender!.toJson();
    }
    return data;
  }
}

class Sender {
  String? id;
  String? createdAt;
  String? updatedAt;
  String? profileImage;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  String? bio;
  String? location;
  String? socialLinks;
  String? lastLogin;
  bool? online;
  String? role;

  Sender(
      {this.id,
      this.createdAt,
      this.updatedAt,
      this.profileImage,
      this.username,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.password,
      this.bio,
      this.location,
      this.socialLinks,
      this.lastLogin,
      this.online,
      this.role});

  Sender.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profileImage = json['profile_image'];
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    bio = json['bio'];
    location = json['location'];
    socialLinks = json['social_links'];
    lastLogin = json['last_login'];
    online = json['online'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['profile_image'] = this.profileImage;
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['bio'] = this.bio;
    data['location'] = this.location;
    data['social_links'] = this.socialLinks;
    data['last_login'] = this.lastLogin;
    data['online'] = this.online;
    data['role'] = this.role;
    return data;
  }
}
