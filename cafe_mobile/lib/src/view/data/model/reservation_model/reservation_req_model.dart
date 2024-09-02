
import 'package:json_annotation/json_annotation.dart';

part 'reservation_req_model.g.dart';

@JsonSerializable()
class ReservationReqModel {

  late int id;
  late bool is_reserver;
  late String reserved_date;
  late String reserved_hour;

  ReservationReqModel(this.id, this.is_reserver, this.reserved_date, this.reserved_hour);

  factory ReservationReqModel.fromJson(Map<String, dynamic> json)=> _$ReservationReqModelFromJson(json);
  Map<String, dynamic> toJson()=> _$ReservationReqModelToJson(this);
}