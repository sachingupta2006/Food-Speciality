class ExploreModel {
  ExploreModel({
    required this.recipes,
  });
  late final List<Recipes> recipes;
  
  ExploreModel.fromJson(Map<String, dynamic> json){
    recipes = List.from(json['recipes']).map((e)=>Recipes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['recipes'] = recipes.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Recipes {
  Recipes({
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
  
  Recipes.fromJson(Map<String, dynamic> json){
    id = json['id'];
    video = null;
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
    return _data;
  }
}