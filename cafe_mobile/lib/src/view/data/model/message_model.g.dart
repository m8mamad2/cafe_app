// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      json['data'] as String,
      json['type'] as String,
      json['sender'] as String,
      json['receiver'] as String,
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'data': instance.data,
      'type': instance.type,
      'sender': instance.sender,
      'receiver': instance.receiver,
    };
