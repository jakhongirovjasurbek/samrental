// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarResponseModel _$CarResponseModelFromJson(Map<String, dynamic> json) =>
    CarResponseModel(
      status: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : CarResponseDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CarResponseModelToJson(CarResponseModel instance) =>
    <String, dynamic>{
      'success': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

CarResponseDataModel _$CarResponseDataModelFromJson(
        Map<String, dynamic> json) =>
    CarResponseDataModel(
      cars: (json['cars'] as List<dynamic>?)
              ?.map((e) =>
                  CarResponseDataCarsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CarResponseDataModelToJson(
        CarResponseDataModel instance) =>
    <String, dynamic>{
      'cars': instance.cars,
    };

CarResponseDataCarsModel _$CarResponseDataCarsModelFromJson(
        Map<String, dynamic> json) =>
    CarResponseDataCarsModel(
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      id: json['_id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      cost: json['cost'] as int? ?? 0,
    );

Map<String, dynamic> _$CarResponseDataCarsModelToJson(
        CarResponseDataCarsModel instance) =>
    <String, dynamic>{
      'images': instance.images,
      '_id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'type': instance.type,
      'cost': instance.cost,
    };
