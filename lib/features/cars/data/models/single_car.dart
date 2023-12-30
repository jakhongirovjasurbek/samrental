import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:samrental/features/cars/domain/entity/car.dart';

part 'single_car.g.dart';

SingleCarModel singleCarModelFromJson(String str) =>
    SingleCarModel.fromJson(json.decode(str));

String singleCarModelToJson(SingleCarModel data) => json.encode(data.toJson());

@JsonSerializable()
class SingleCarModel extends SingleCarEntity {
  @JsonKey(name: "images", defaultValue: [])
  final List<String> images;
  @JsonKey(name: "_id", defaultValue: '')
  final String id;
  @JsonKey(name: "name", defaultValue: '')
  final String name;
  @JsonKey(name: "title", defaultValue: '')
  final String title;
  @JsonKey(name: "type", defaultValue: '')
  final String type;
  @JsonKey(name: "cost", defaultValue: 0)
  final int cost;
  @JsonKey(name: "place", defaultValue: 0)
  final int place;
  @JsonKey(name: "baggage", defaultValue: 0)
  final int baggage;
  @JsonKey(name: "fuel_type", defaultValue: '')
  final String fuelType;
  @JsonKey(name: "conditioner", defaultValue: false)
  final bool conditioner;
  @JsonKey(name: "max_speed", defaultValue: 0)
  final int maxSpeed;
  @JsonKey(name: "tinting", defaultValue: false)
  final bool tinting;
  @JsonKey(name: "created_at", defaultValue: 0)
  final int createdAt;
  @JsonKey(name: "__v", defaultValue: 0)
  final int v;

  const SingleCarModel({
    required this.images,
    required this.id,
    required this.name,
    required this.title,
    required this.type,
    required this.cost,
    required this.place,
    required this.baggage,
    required this.fuelType,
    required this.conditioner,
    required this.maxSpeed,
    required this.tinting,
    required this.createdAt,
    required this.v,
  });

  factory SingleCarModel.fromJson(Map<String, dynamic> json) =>
      _$SingleCarModelFromJson(json);

  Map<String, dynamic> toJson() => _$SingleCarModelToJson(this);
}
