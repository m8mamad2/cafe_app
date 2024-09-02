import 'package:json_annotation/json_annotation.dart';

part 'geocoding_model.g.dart';

@JsonSerializable()
class GeocodingModel {
  late int? place_id;
  late String? licence;
  late String? osm_type;
  late int? osm_id;
  late String? lat;
  late String? lon;
  late String? display_name;
  late Address address;
  late List<String?> boundingbox;

  GeocodingModel(
    this.place_id,
    this.licence,
    this.osm_type,
    this.osm_id,
    this.lat,
    this.lon,
    this.display_name,
    this.address,
    this.boundingbox);

  factory GeocodingModel.fromJson(Map<String, dynamic> json) => _$GeocodingModelFromJson(json);
  Map<String, dynamic> toJson() => _$GeocodingModelToJson(this);
}

@JsonSerializable()
class Address {
  final String? road;
  final String? neighbourhood;
  final String? suburb;
  final String? city;
  final String? district;
  final String? county;
  final String? state;
  @JsonKey(name: 'ISO3166-2-lvl4')
  final String? ISO3166_2_lvl4;
  final String? postcode;
  final String? country;
  final String? country_code;

  Address(
    this.road,
    this.neighbourhood,
    this.suburb,
    this.city,
    this.district,
    this.county,
    this.state,
    this.ISO3166_2_lvl4,
    this.postcode,
    this.country,
    this.country_code,);

  factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}