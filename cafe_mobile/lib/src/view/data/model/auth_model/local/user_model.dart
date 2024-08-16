import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@collection
class UserModel {
  
  @JsonKey(ignore: true)
  Id localId = Isar.autoIncrement;

  late int? id;
  
  late String? email;
  
  late String? password;
  
  late String? userName;
  
  late String? name;
  
  late String? family;
  
  late String? address;
  
  late String? phoneNumber;
  
  late String? access_token;

  UserModel();

  factory UserModel.fromJson(Map<String, dynamic> json)=> _$UserModelFromJson(json);
  Map<String, dynamic> toJson()=> _$UserModelToJson(this);
}

