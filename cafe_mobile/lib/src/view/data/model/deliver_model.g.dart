// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deliver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeliverModel _$DeliverModelFromJson(Map<String, dynamic> json) => DeliverModel(
      (json['lat'] as num).toDouble(),
      (json['lon'] as num).toDouble(),
      json['receiver'] as String,
    );

Map<String, dynamic> _$DeliverModelToJson(DeliverModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'receiver': instance.receiver,
    };
