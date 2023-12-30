import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'car_response.g.dart';

@JsonSerializable()
class CarResponseModel extends Equatable {
  @JsonKey(name: 'success', defaultValue: false)
  final bool status;
  @JsonKey(name: 'message', defaultValue: '')
  final String message;
  @JsonKey(name: 'data')
  final CarResponseDataModel? data;

  const CarResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CarResponseModel.fromJson(Map<String, dynamic> data) =>
      _$CarResponseModelFromJson(data);

  Map<String, dynamic> toJson() => _$CarResponseModelToJson(this);

  @override
  List<Object> get props => [status, message];

  @override
  String toString() => 'CarResponseModel{status: $status, message: $message}';
}

@JsonSerializable()
class CarResponseDataModel extends Equatable {
  @JsonKey(name: 'cars', defaultValue: [])
  final List<CarResponseDataCarsModel> cars;

  const CarResponseDataModel({
    required this.cars,
  });

  factory CarResponseDataModel.fromJson(Map<String, dynamic> data) =>
      _$CarResponseDataModelFromJson(data);

  Map<String, dynamic> toJson() => _$CarResponseDataModelToJson(this);

  @override
  List<Object> get props => [cars];

  @override
  String toString() => 'CarResponseDataModel{cars: $cars}';
}

@JsonSerializable()
class CarResponseDataCarsModel extends Equatable {
  @JsonKey(name: 'images', defaultValue: [])
  final List<String> images;
  @JsonKey(name: '_id', defaultValue: '')
  final String id; // _id
  @JsonKey(name: 'name', defaultValue: '')
  final String name;
  @JsonKey(name: 'title', defaultValue: '')
  final String title;
  @JsonKey(name: 'type', defaultValue: '')
  final String type;
  @JsonKey(name: 'cost', defaultValue: 0)
  final int cost;

  const CarResponseDataCarsModel({
    required this.images,
    required this.id,
    required this.name,
    required this.title,
    required this.type,
    required this.cost,
  });

  factory CarResponseDataCarsModel.fromJson(Map<String, dynamic> data) =>
      _$CarResponseDataCarsModelFromJson(data);

  Map<String, dynamic> toJson() => _$CarResponseDataCarsModelToJson(this);

  @override
  List<Object> get props => [images, id, name, title, type, cost];

  @override
  String toString() =>
      'CarResponseDataCarsModel{images: $images, id: $id, name: $name, title: $title, type: $type, cost: $cost}';
}
