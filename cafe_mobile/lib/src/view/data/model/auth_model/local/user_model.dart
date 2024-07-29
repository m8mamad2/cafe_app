// class AuthResModel {
//   int? id;
//   String? email;
//   String? password;
//   String? userName;
//   String? name;
//   String? family;
//   String? address;
//   String? phoneNumber;
//   String? accessToken;

//   AuthResModel(
//       {this.id,
//       this.email,
//       this.password,
//       this.userName,
//       this.name,
//       this.family,
//       this.address,
//       this.phoneNumber,
//       this.accessToken});

//   AuthResModel.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     email = json['email'];
//     password = json['password'];
//     userName = json['userName'];
//     name = json['name'];
//     family = json['family'];
//     address = json['address'];
//     phoneNumber = json['phoneNumber'];
//     accessToken = json['access_token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['email'] = this.email;
//     data['password'] = this.password;
//     data['userName'] = this.userName;
//     data['name'] = this.name;
//     data['family'] = this.family;
//     data['address'] = this.address;
//     data['phoneNumber'] = this.phoneNumber;
//     data['access_token'] = this.accessToken;
//     return data;
//   }

// }

import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
@collection
class UserModel {
  
  Id localId = Isar.autoIncrement;

  @ignore
  late num? id;
  
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

