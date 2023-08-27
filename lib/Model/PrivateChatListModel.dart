class PrivateChatListModel {
  bool? success;
  List<Data>? data;

  PrivateChatListModel({this.success, this.data});

  PrivateChatListModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? message;
  String? createdAt;

  Data({this.user, this.message, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    message = json['message'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['message'] = this.message;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class User {
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
