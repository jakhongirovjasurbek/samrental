part of 'single_car_bloc.dart';

class SingleCarState extends Equatable {
  final LoadingStatus status;
  final SingleCarEntity singleCar;
  final YandexMapController? mapController;
  final MapAnimation? animation;
  final double? latitude;
  final double? longitude;
  final MapType mapType;

  const SingleCarState({
    required this.status,
    required this.singleCar,
    this.mapController,
    this.animation,
    this.latitude,
    this.longitude,
    this.mapType = MapType.map,
  });

  SingleCarState copyWith({
    LoadingStatus? status,
    SingleCarEntity? singleCar,
    YandexMapController? mapController,
    MapAnimation? animation,
    double? latitude,
    double? longitude,
    MapType? mapType,
  }) {
    return SingleCarState(
      status: status ?? this.status,
      singleCar: singleCar ?? this.singleCar,
      mapController: mapController ?? this.mapController,
      animation: animation ?? this.animation,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      mapType: mapType ?? this.mapType,
    );
  }

  @override
  List<Object?> get props => [
        status,
        singleCar,
        mapController,
        animation,
        latitude,
        longitude,
        mapType,
      ];
}