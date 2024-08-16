import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite_model.g.dart';

@collection
class FavoriteModel{

  @JsonKey(ignore: true)
  Id localId = Isar.autoIncrement;

  // @ignore
  late int? id;
  
  late String? title;
  
  late String? description;
  
  late List<String>? images;
  
  late int? price;
  
  FavoriteModel(this.id, this.title, this.description, this.images, this.price);

  factory FavoriteModel.fromFoodModel(FoodModel foodModel)=> FavoriteModel(foodModel.id, foodModel.title, foodModel.description, foodModel.images, foodModel.price, );

} 