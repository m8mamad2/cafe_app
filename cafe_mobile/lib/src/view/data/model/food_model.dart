import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:cafe_mobile/src/view/data/model/favorite_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_model.g.dart';

@JsonSerializable()
@collection
class FoodModel{

  @JsonKey(ignore: true)
  Id localId = Isar.autoIncrement;

  // @ignore
  late int? id;
  
  late String? title;
  
  late String? description;
  
  late List<String>? images;
  
  late int? price;
  
  FoodModel(this.id, this.title, this.description, this.images, this.price);

  factory FoodModel.fromJson(Map<String, dynamic> json)=> _$FoodModelFromJson(json);
  Map<String, dynamic> toJson()=> _$FoodModelToJson(this);


  factory FoodModel.fromFavoriteModel(FavoriteModel favoriteModel)=> FoodModel(favoriteModel.id, favoriteModel.title, favoriteModel.description, favoriteModel.images, favoriteModel.price);
  factory FoodModel.fromCartModel(CartModel favoriteModel)=> FoodModel(favoriteModel.id, favoriteModel.title, favoriteModel.description, favoriteModel.images, favoriteModel.price);
} 