
import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  
  late String data;
  late String type;
  late String sender;
  late String receiver;

  MessageModel(this.data, this.type, this.sender, this.receiver,);

  factory MessageModel.fromJson(Map<String, dynamic> json)=> _$MessageModelFromJson(json);
  Map<String, dynamic> toJson()=> _$MessageModelToJson(this);

} 