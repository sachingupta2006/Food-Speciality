class Comments {
  Comments({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  Comments.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.comment,
    required this.createdAt,
    required this.recipeId,
     this.replyId,
    required this.userId,
    required this.user,
    required this.likedComments,
    required this.liked,
    required this.repliesLength,
  });
  late final String id;
  late final String comment;
  late final String createdAt;
  late final String recipeId;
  late final Null replyId;
  late final String userId;
  late final User user;
  late final List<dynamic> likedComments;
  late final bool liked;
  late final int repliesLength;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    comment = json['comment'];
    createdAt = json['createdAt'];
    recipeId = json['recipeId'];
    replyId = null;
    userId = json['userId'];
    user = User.fromJson(json['user']);
    likedComments = List.castFrom<dynamic, dynamic>(json['liked_comments']);
    liked = json['liked'];
    repliesLength = json['repliesLength'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['comment'] = comment;
    _data['createdAt'] = createdAt;
    _data['recipeId'] = recipeId;
    _data['replyId'] = replyId;
    _data['userId'] = userId;
    _data['user'] = user.toJson();
    _data['liked_comments'] = likedComments;
    _data['liked'] = liked;
    _data['repliesLength'] = repliesLength;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
     this.profileImage,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.password,
     this.bio,
     this.location,
     this.socialLinks,
    // required this.lastLogin,
    required this.online,
    required this.role,
  });
  late final String id;
  late final String createdAt;
  late final String updatedAt;
  late final String? profileImage;
  late final String username;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String password;
  late final Null bio;
  late final Null location;
  late final Null socialLinks;
  // late final String lastLogin;
  late final bool online;
  late final String role;
  
  User.fromJson(Map<String, dynamic> json){
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
    bio = null;
    location = null;
    socialLinks = null;
    // lastLogin = json['last_login'];
    online = json['online'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['profile_image'] = profileImage;
    _data['username'] = username;
    _data['first_name'] = firstName;
    _data['last_name'] = lastName;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['password'] = password;
    _data['bio'] = bio;
    _data['location'] = location;
    _data['social_links'] = socialLinks;
    // _data['last_login'] = lastLogin;
    _data['online'] = online;
    _data['role'] = role;
    return _data;
  }
}