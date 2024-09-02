
import 'package:json_annotation/json_annotation.dart';

part 'reservation_model.g.dart';

@JsonSerializable()
class ReservationModel {

  late int id;
  late String table;
  late int chairs_number;
  late bool is_reserver;
  late String reserved_date;
  late String reserved_hour;

  ReservationModel( this.table, this.chairs_number, this.is_reserver, this.reserved_date, this.reserved_hour, );

  factory ReservationModel.fromJson(Map<String, dynamic> json)=> _$ReservationModelFromJson(json);
  Map<String, dynamic> toJson()=> _$ReservationModelToJson(this);
}