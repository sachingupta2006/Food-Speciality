class OnGoingChallenges {
  OnGoingChallenges({
    required this.success,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final String message;
  late final List<Data> data;
  
  OnGoingChallenges.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
     this.thumbnail,
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.challengeRecipe,
    required this.recipeCount,
  });
  late final String id;
  late final Null thumbnail;
  late final String title;
  late final String description;
  late final String startDate;
  late final String endDate;
  late final String status;
  late final List<ChallengeRecipe> challengeRecipe;
  late final int recipeCount;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    thumbnail = null;
    title = json['title'];
    description = json['description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    challengeRecipe = List.from(json['challenge_recipe']).map((e)=>ChallengeRecipe.fromJson(e)).toList();
    recipeCount = json['recipeCount'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['thumbnail'] = thumbnail;
    _data['title'] = title;
    _data['description'] = description;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['status'] = status;
    _data['challenge_recipe'] = challengeRecipe.map((e)=>e.toJson()).toList();
    _data['recipeCount'] = recipeCount;
    return _data;
  }
}

class ChallengeRecipe {
  ChallengeRecipe({
    required this.userId,
    required this.recipeId,
  });
  late final String userId;
  late final String recipeId;
  
  ChallengeRecipe.fromJson(Map<String, dynamic> json){
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