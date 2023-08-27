class RecipeModel {
  bool? success;
  List<Data>? data;

  RecipeModel({this.success, this.data});

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
      success: json['success'],
      data: List<Data>.from(
          (json['data'] ?? []).map((data) => Data.fromJson(data))),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'success': this.success,
      'data': this.data?.map((data) => data.toJson()).toList(),
    };
    return data;
  }
}

class Data {
  String? id;
  String? video;
  String? coverImage;
  String? name;
  String? description;
  String? difficulty;
  String? cookingTime;
  String? servings;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? userId;
  String? publishedStatus;
  List<Ingredients>? ingredients;
  User? user;
  List<Tags>? tags;
  int? comments;
  int? likes;
  bool? liked;
  bool? saved;
  bool? following;

  Data({
    this.id,
    this.video,
    this.coverImage,
    this.name,
    this.description,
    this.difficulty,
    this.cookingTime,
    this.servings,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.publishedStatus,
    this.ingredients,
    this.user,
    this.tags,
    this.comments,
    this.likes,
    this.liked,
    this.saved,
    this.following,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      video: json['video'],
      coverImage: json['cover_image'],
      name: json['name'],
      description: json['description'],
      difficulty: json['difficulty'],
      cookingTime: json['cooking_time'],
      servings: json['servings'],
      status: json['status'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      userId: json['userId'],
      publishedStatus: json['published_status'],
      ingredients: List<Ingredients>.from((json['ingredients'] ?? [])
          .map((data) => Ingredients.fromJson(data))),
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      tags: List<Tags>.from(
          (json['tags'] ?? []).map((data) => Tags.fromJson(data))),
      comments: json['comments'],
      likes: json['likes'],
      liked: json['liked'],
      saved: json['saved'],
      following: json['following'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': this.id,
      'video': this.video,
      'cover_image': this.coverImage,
      'name': this.name,
      'description': this.description,
      'difficulty': this.difficulty,
      'cooking_time': this.cookingTime,
      'servings': this.servings,
      'status': this.status,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'userId': this.userId,
      'published_status': this.publishedStatus,
      'ingredients': this.ingredients?.map((data) => data.toJson()).toList(),
      'user': this.user?.toJson(),
      'tags': this.tags?.map((data) => data.toJson()).toList(),
      'comments': this.comments,
      'likes': this.likes,
      'liked': this.liked,
      'saved': this.saved,
      'following': this.following,
    };
    return data;
  }
}

class Ingredients {
  String? id;
  String? name;
  String? quantity;
  String? recipeId;

  Ingredients({this.id, this.name, this.quantity, this.recipeId});

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      recipeId: json['recipeId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': this.id,
      'name': this.name,
      'quantity': this.quantity,
      'recipeId': this.recipeId,
    };
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

  User({
    this.id,
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
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      profileImage: json['profile_image'],
      username: json['username'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      bio: json['bio'],
      location: json['location'],
      socialLinks: json['social_links'],
      lastLogin: json['last_login'],
      online: json['online'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': this.id,
      'createdAt': this.createdAt,
      'updatedAt': this.updatedAt,
      'profile_image': this.profileImage,
      'username': this.username,
      'first_name': this.firstName,
      'last_name': this.lastName,
      'email': this.email,
      'phone': this.phone,
      'password': this.password,
      'bio': this.bio,
      'location': this.location,
      'social_links': this.socialLinks,
      'last_login': this.lastLogin,
      'online': this.online,
      'role': this.role,
    };
    return data;
  }
}

class Tags {
  String? id;
  String? recipeId;
  String? tagId;
  Tag? tag;

  Tags({this.id, this.recipeId, this.tagId, this.tag});

  factory Tags.fromJson(Map<String, dynamic> json) {
    return Tags(
      id: json['id'],
      recipeId: json['recipeId'],
      tagId: json['tagId'],
      tag: json['tag'] != null ? Tag.fromJson(json['tag']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': this.id,
      'recipeId': this.recipeId,
      'tagId': this.tagId,
      'tag': this.tag?.toJson(),
    };
    return data;
  }
}

class Tag {
  String? id;
  String? name;
  String? tagCategoryId;

  Tag({this.id, this.name, this.tagCategoryId});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      id: json['id'],
      name: json['name'],
      tagCategoryId: json['tag_categoryId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': this.id,
      'name': this.name,
      'tag_categoryId': this.tagCategoryId,
    };
    return data;
  }
}
