
import 'package:json_annotation/json_annotation.dart';

part 'deliver_model.g.dart';

@JsonSerializable()
class DeliverModel {
  late double lat;
  late double lon;
  late String receiver;

  DeliverModel(this.lat, this.lon, this.receiver);


  factory DeliverModel.fromJson(Map<String, dynamic> json)=> _$DeliverModelFromJson(json);
  Map<String, dynamic> toJson()=> _$DeliverModelToJson(this);
  
}