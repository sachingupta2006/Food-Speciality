class TrendingRecipe {
  TrendingRecipe({
    required this.success,
    required this.data,
  });
  late final bool success;
  late final List<Data> data;
  
  TrendingRecipe.fromJson(Map<String, dynamic> json){
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
    required this.name,
    required this.description,
    required this.createdAt,
    required this.coverImage,
    required this.user,
    required this.cookingTime,
    required this.likedRecipe,
    required this.savedRecipe,
    required this.comments,
    required this.score,
    required this.likes,
    required this.liked,
    required this.saved,
  });
  late final String id;
  late final String name;
  late final String description;
  late final String createdAt;
  late final String coverImage;
  late final User user;
  late final String cookingTime;
  late final List<LikedRecipe> likedRecipe;
  late final List<SavedRecipe> savedRecipe;
  late final int comments;
  late final int score;
  late final int likes;
  late final bool liked;
  late final bool saved;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['createdAt'];
    coverImage = json['cover_image'];
    user = User.fromJson(json['user']);
    cookingTime = json['cooking_time'];
    likedRecipe = List.from(json['liked_recipe']).map((e)=>LikedRecipe.fromJson(e)).toList();
    savedRecipe = List.from(json['saved_recipe']).map((e)=>SavedRecipe.fromJson(e)).toList();
    comments = json['comments'];
    score = json['score'];
    likes = json['likes'];
    liked = json['liked'];
    saved = json['saved'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['description'] = description;
    _data['createdAt'] = createdAt;
    _data['cover_image'] = coverImage;
    _data['user'] = user.toJson();
    _data['cooking_time'] = cookingTime;
    _data['liked_recipe'] = likedRecipe.map((e)=>e.toJson()).toList();
    _data['saved_recipe'] = savedRecipe.map((e)=>e.toJson()).toList();
    _data['comments'] = comments;
    _data['score'] = score;
    _data['likes'] = likes;
    _data['liked'] = liked;
    _data['saved'] = saved;
    return _data;
  }
}

class User {
  User({
    required this.username,
  });
  late final String username;
  
  User.fromJson(Map<String, dynamic> json){
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['username'] = username;
    return _data;
  }
}

class LikedRecipe {
  LikedRecipe({
    required this.userId,
  });
  late final String userId;
  
  LikedRecipe.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    return _data;
  }
}

class SavedRecipe {
  SavedRecipe({
    required this.userId,
  });
  late final String userId;
  
  SavedRecipe.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    return _data;
  }
}