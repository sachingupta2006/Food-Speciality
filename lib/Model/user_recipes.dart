class UserRecipes {
  UserRecipes({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  UserRecipes.fromJson(Map<String, dynamic> json){
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
     this.video,
     this.coverImage,
    required this.name,
    required this.description,
    required this.difficulty,
    required this.cookingTime,
    required this.servings,
     this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.userId,
    required this.publishedStatus,
    required this.ingredients,
    required this.user,
    required this.tags,
  });
  late final String id;
  late final String? video;
  late final String? coverImage;
  late final String name;
  late final String description;
  late final String difficulty;
  late final String cookingTime;
  late final String servings;
  late final Null status;
  late final String createdAt;
  late final String updatedAt;
  late final String userId;
  late final String publishedStatus;
  late final List<Ingredients> ingredients;
  late final User user;
  late final List<Tags> tags;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    video = json['video'];
    coverImage = json['cover_image'];
    name = json['name'];
    description = json['description'];
    difficulty = json['difficulty'];
    cookingTime = json['cooking_time'];
    servings = json['servings'];
    status = null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    publishedStatus = json['published_status'];
    ingredients = List.from(json['ingredients']).map((e)=>Ingredients.fromJson(e)).toList();
    user = User.fromJson(json['user']);
    tags = List.from(json['tags']).map((e)=>Tags.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['video'] = video;
    _data['cover_image'] = coverImage;
    _data['name'] = name;
    _data['description'] = description;
    _data['difficulty'] = difficulty;
    _data['cooking_time'] = cookingTime;
    _data['servings'] = servings;
    _data['status'] = status;
    _data['createdAt'] = createdAt;
    _data['updatedAt'] = updatedAt;
    _data['userId'] = userId;
    _data['published_status'] = publishedStatus;
    _data['ingredients'] = ingredients.map((e)=>e.toJson()).toList();
    _data['user'] = user.toJson();
    _data['tags'] = tags.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Ingredients {
  Ingredients({
    required this.id,
    required this.name,
    required this.quantity,
    required this.recipeId,
  });
  late final String id;
  late final String name;
  late final String quantity;
  late final String recipeId;
  
  Ingredients.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    quantity = json['quantity'];
    recipeId = json['recipeId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['quantity'] = quantity;
    _data['recipeId'] = recipeId;
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
     this.lastLogin,
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
  late final String? bio;
  late final String? location;
  late final String? socialLinks;
  late final String? lastLogin;
  late final bool online;
  late final String role;
  
  User.fromJson(Map<String, dynamic> json){
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    profileImage = null;
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    bio = null;
    location = null;
    socialLinks = null;
    lastLogin = null;
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
    _data['last_login'] = lastLogin;
    _data['online'] = online;
    _data['role'] = role;
    return _data;
  }
}

class Tags {
  Tags({
    required this.id,
    required this.recipeId,
    required this.tagId,
    required this.tag,
  });
  late final String id;
  late final String recipeId;
  late final String tagId;
  late final Tag tag;
  
  Tags.fromJson(Map<String, dynamic> json){
    id = json['id'];
    recipeId = json['recipeId'];
    tagId = json['tagId'];
    tag = Tag.fromJson(json['tag']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['recipeId'] = recipeId;
    _data['tagId'] = tagId;
    _data['tag'] = tag.toJson();
    return _data;
  }
}

class Tag {
  Tag({
    required this.id,
    required this.name,
     this.tagCategoryId,
  });
  late final String id;
  late final String name;
  late final Null tagCategoryId;
  
  Tag.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    tagCategoryId = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['tag_categoryId'] = tagCategoryId;
    return _data;
  }
}