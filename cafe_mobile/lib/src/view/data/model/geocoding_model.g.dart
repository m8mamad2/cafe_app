// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingModel _$GeocodingModelFromJson(Map<String, dynamic> json) =>
    GeocodingModel(
      (json['place_id'] as num?)?.toInt(),
      json['licence'] as String?,
      json['osm_type'] as String?,
      (json['osm_id'] as num?)?.toInt(),
      json['lat'] as String?,
      json['lon'] as String?,
      json['display_name'] as String?,
      Address.fromJson(json['address'] as Map<String, dynamic>),
      (json['boundingbox'] as List<dynamic>).map((e) => e as String?).toList(),
    );

Map<String, dynamic> _$GeocodingModelToJson(GeocodingModel instance) =>
    <String, dynamic>{
      'place_id': instance.place_id,
      'licence': instance.licence,
      'osm_type': instance.osm_type,
      'osm_id': instance.osm_id,
      'lat': instance.lat,
      'lon': instance.lon,
      'display_name': instance.display_name,
      'address': instance.address,
      'boundingbox': instance.boundingbox,
    };

Address _$AddressFromJson(Map<String, dynamic> json) => Address(
      json['road'] as String?,
      json['neighbourhood'] as String?,
      json['suburb'] as String?,
      json['city'] as String?,
      json['district'] as String?,
      json['county'] as String?,
      json['state'] as String?,
      json['ISO3166-2-lvl4'] as String?,
      json['postcode'] as String?,
      json['country'] as String?,
      json['country_code'] as String?,
    );

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'road': instance.road,
      'neighbourhood': instance.neighbourhood,
      'suburb': instance.suburb,
      'city': instance.city,
      'district': instance.district,
      'county': instance.county,
      'state': instance.state,
      'ISO3166-2-lvl4': instance.ISO3166_2_lvl4,
      'postcode': instance.postcode,
      'country': instance.country,
      'country_code': instance.country_code,
    };
