// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      (json['id'] as num?)?.toInt(),
      (json['userId'] as num?)?.toInt(),
      json['title'] as String?,
      json['description'] as String?,
      (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      (json['price'] as num?)?.toInt(),
      json['isComplete'] as bool?,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
      'price': instance.price,
      'isComplete': instance.isComplete,
    };
