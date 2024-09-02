import 'package:cafe_mobile/src/view/data/model/cart_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel{

  late int? id;
  late int? userId;
  late String? title;
  late String? description;
  late List<String>? images;
  late int? price;
  late bool? isComplete;

  OrderModel(this.id, this.userId, this.title, this.description, this.images, this.price, this.isComplete);

  factory OrderModel.fromJson(Map<String, dynamic> json)=> _$OrderModelFromJson(json);
  Map<String, dynamic> toJson()=> _$OrderModelToJson(this);

  factory OrderModel.fromCartModel(CartModel cartModel)=> OrderModel(cartModel.id, null , cartModel.title, cartModel.description, cartModel.images, cartModel.price, false);
}