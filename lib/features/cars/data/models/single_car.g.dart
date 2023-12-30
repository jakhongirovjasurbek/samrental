// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_car.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleCarModel _$SingleCarModelFromJson(Map<String, dynamic> json) =>
    SingleCarModel(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      cost: json['cost'] as int? ?? 0,
      place: json['place'] as int? ?? 0,
      baggage: json['baggage'] as int? ?? 0,
      fuelType: json['fuel_type'] as String? ?? '',
      conditioner: json['conditioner'] as bool? ?? false,
      maxSpeed: json['max_speed'] as int? ?? 0,
      tinting: json['tinting'] as bool? ?? false,
      createdAt: json['created_at'] as int? ?? 0,
      v: json['__v'] as int? ?? 0,
    );

Map<String, dynamic> _$SingleCarModelToJson(SingleCarModel instance) =>
    <String, dynamic>{
      'images': instance.images,
      '_id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'type': instance.type,
      'cost': instance.cost,
      'place': instance.place,
      'baggage': instance.baggage,
      'fuel_type': instance.fuelType,
      'conditioner': instance.conditioner,
      'max_speed': instance.maxSpeed,
      'tinting': instance.tinting,
      'created_at': instance.createdAt,
      '__v': instance.v,
    };
