class Followes {
  bool? success;
  Data? data;

  Followes({this.success, this.data});

  Followes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Followings>? followings;
  List<Followers>? followers;

  Data({this.followings, this.followers});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['followings'] != null) {
      followings = <Followings>[];
      json['followings'].forEach((v) {
        followings!.add(new Followings.fromJson(v));
      });
    }
    if (json['followers'] != null) {
      followers = <Followers>[];
      json['followers'].forEach((v) {
        followers!.add(new Followers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.followings != null) {
      data['followings'] = this.followings!.map((v) => v.toJson()).toList();
    }
    if (this.followers != null) {
      data['followers'] = this.followers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Followings {
  Following? following;

  Followings({this.following});

  Followings.fromJson(Map<String, dynamic> json) {
    following = json['following'] != null
        ? new Following.fromJson(json['following'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.following != null) {
      data['following'] = this.following!.toJson();
    }
    return data;
  }
}

class Following {
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
  bool isFollowing = true;

  Following(
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
      this.online});

  Following.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class Followers {
  Following? follower;

  Followers({this.follower});

  Followers.fromJson(Map<String, dynamic> json) {
    follower = json['follower'] != null
        ? new Following.fromJson(json['follower'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.follower != null) {
      data['follower'] = this.follower!.toJson();
    }
    return data;
  }
}
