// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'init_deliver_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InitDeliverModel _$InitDeliverModelFromJson(Map<String, dynamic> json) =>
    InitDeliverModel(
      (json['start_point'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      (json['end_point'] as List<dynamic>)
          .map((e) => (e as num).toDouble())
          .toList(),
      DeliverModel.fromJson(json['deliver_init_point'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InitDeliverModelToJson(InitDeliverModel instance) =>
    <String, dynamic>{
      'start_point': instance.start_point,
      'end_point': instance.end_point,
      'deliver_init_point': instance.deliver_init_point,
    };
