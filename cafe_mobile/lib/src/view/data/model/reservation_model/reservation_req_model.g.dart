// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationReqModel _$ReservationReqModelFromJson(Map<String, dynamic> json) =>
    ReservationReqModel(
      (json['id'] as num).toInt(),
      json['is_reserver'] as bool,
      json['reserved_date'] as String,
      json['reserved_hour'] as String,
    );

Map<String, dynamic> _$ReservationReqModelToJson(
        ReservationReqModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_reserver': instance.is_reserver,
      'reserved_date': instance.reserved_date,
      'reserved_hour': instance.reserved_hour,
    };
