import 'package:cafe_mobile/src/view/data/model/food_model.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_model.g.dart';

@collection
class CartModel{

  @JsonKey(ignore: true)
  Id localId = Isar.autoIncrement;

  late int? id;
  
  late String? title;
  
  late String? description;
  
  late List<String>? images;
  
  late int? price;

  int howMuch = 0;
  
  CartModel( this.id, this.title, this.description, this.images, this.price,this.howMuch);

  factory CartModel.fromFoodModel(FoodModel foodModel)=> CartModel(foodModel.id, foodModel.title, foodModel.description, foodModel.images, foodModel.price, 0);
  
  CartModel coptyWith({int? id, String? title, String? description, List<String>? images,int? price,int? howMuch})=> 
    CartModel(id ?? this.id, title ?? this.title, description ?? this.description,  images ?? this.images, price ?? this.price, howMuch ?? this.howMuch);
    
} 