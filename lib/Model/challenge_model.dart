class ChallengeModel {
  ChallengeModel({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final Data data;
  
  ChallengeModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.challengeDetails,
    required this.recipes,
  });
  late final ChallengeDetails challengeDetails;
  late final List<Recipes> recipes;
  
  Data.fromJson(Map<String, dynamic> json){
    challengeDetails = ChallengeDetails.fromJson(json['challengeDetails']);
    recipes = List.from(json['recipes']).map((e)=>Recipes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['challengeDetails'] = challengeDetails.toJson();
    _data['recipes'] = recipes.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ChallengeDetails {
  ChallengeDetails({
     this.thumbnail,
    required this.title,
    required this.description,
    required this.startTime,
    required this.endTime,
    required this.timeLeft,
  });
  late final String? thumbnail;
  late final String title;
  late final String description;
  late final String startTime;
  late final String endTime;
  late final TimeLeft timeLeft;
  
  ChallengeDetails.fromJson(Map<String, dynamic> json){
    thumbnail = json['thumbnail'];
    title = json['title'];
    description = json['description'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    timeLeft = TimeLeft.fromJson(json['timeLeft']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['thumbnail'] = thumbnail;
    _data['title'] = title;
    _data['description'] = description;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['timeLeft'] = timeLeft.toJson();
    return _data;
  }
}

class TimeLeft {
  TimeLeft({
    required this.days,
    required this.hours,
    required this.minutes,
  });
  late final int days;
  late final int hours;
  late final int minutes;
  
  TimeLeft.fromJson(Map<String, dynamic> json){
    days = json['days'];
    hours = json['hours'];
    minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['days'] = days;
    _data['hours'] = hours;
    _data['minutes'] = minutes;
    return _data;
  }
}

class Recipes {
  Recipes({
    required this.recipe,
    required this.likes,
    required this.saves,
    required this.comments,
    required this.liked,
    required this.saved,
  });
  late final Recipe recipe;
  late final int likes;
  late final int saves;
  late final int comments;
  late final bool liked;
  late final bool saved;
  
  Recipes.fromJson(Map<String, dynamic> json){
    recipe = Recipe.fromJson(json['recipe']);
    likes = json['likes'];
    saves = json['saves'];
    comments = json['comments'];
    liked = json['liked'];
    saved = json['saved'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['recipe'] = recipe.toJson();
    _data['likes'] = likes;
    _data['saves'] = saves;
    _data['comments'] = comments;
    _data['liked'] = liked;
    _data['saved'] = saved;
    return _data;
  }
}

class Recipe {
  Recipe({
    required this.id,
    required this.video,
    required this.coverImage,
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
    required this.user,
    required this.likedRecipe,
    required this.savedRecipe,
    required this.comments,
  });
  late final String id;
  late final String video;
  late final String coverImage;
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
  late final User user;
  late final List<LikedRecipe> likedRecipe;
  late final List<SavedRecipe> savedRecipe;
  late final List<dynamic> comments;
  
  Recipe.fromJson(Map<String, dynamic> json){
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
    user = User.fromJson(json['user']);
    likedRecipe = List.from(json['liked_recipe']).map((e)=>LikedRecipe.fromJson(e)).toList();
    savedRecipe = List.from(json['saved_recipe']).map((e)=>SavedRecipe.fromJson(e)).toList();
    comments = List.castFrom<dynamic, dynamic>(json['comments']);
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
    _data['user'] = user.toJson();
    _data['liked_recipe'] = likedRecipe.map((e)=>e.toJson()).toList();
    _data['saved_recipe'] = savedRecipe.map((e)=>e.toJson()).toList();
    _data['comments'] = comments;
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
  late final Null profileImage;
  late final String username;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String phone;
  late final String password;
  late final Null bio;
  late final Null location;
  late final Null socialLinks;
  late final Null lastLogin;
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

class LikedRecipe {
  LikedRecipe({
    required this.userId,
    required this.recipeId,
  });
  late final String userId;
  late final String recipeId;
  
  LikedRecipe.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    recipeId = json['recipeId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['recipeId'] = recipeId;
    return _data;
  }
}

class SavedRecipe {
  SavedRecipe({
    required this.userId,
    required this.recipeId,
  });
  late final String userId;
  late final String recipeId;
  
  SavedRecipe.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    recipeId = json['recipeId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['recipeId'] = recipeId;
    return _data;
  }
}