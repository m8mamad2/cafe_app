// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReservationModel _$ReservationModelFromJson(Map<String, dynamic> json) =>
    ReservationModel(
      json['table'] as String,
      (json['chairs_number'] as num).toInt(),
      json['is_reserver'] as bool,
      json['reserved_date'] as String,
      json['reserved_hour'] as String,
    )..id = (json['id'] as num).toInt();

Map<String, dynamic> _$ReservationModelToJson(ReservationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'table': instance.table,
      'chairs_number': instance.chairs_number,
      'is_reserver': instance.is_reserver,
      'reserved_date': instance.reserved_date,
      'reserved_hour': instance.reserved_hour,
    };
