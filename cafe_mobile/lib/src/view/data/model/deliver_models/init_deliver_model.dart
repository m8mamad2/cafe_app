
import 'package:cafe_mobile/src/view/data/model/deliver_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'init_deliver_model.g.dart';

@JsonSerializable()
class InitDeliverModel {
  
  late List<double> start_point;
  late List<double> end_point;
  late DeliverModel deliver_init_point;
  
  InitDeliverModel(this.start_point, this.end_point, this.deliver_init_point);


  factory InitDeliverModel.fromJson(Map<String, dynamic> json)=> _$InitDeliverModelFromJson(json);
  Map<String, dynamic> toJson()=> _$InitDeliverModelToJson(this);

}

// {"start_point":[33.3003,54.3302],"end_point":[33.88333,51.28333],"deliver_init_point":{"lat":33.3003,"lon":54.3302,"receiver":""}}