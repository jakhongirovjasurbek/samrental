part of 'single_car_bloc.dart';

class SingleCarState extends Equatable {
  final LoadingStatus status;
  final LoadingStatus reserveStatus;
  final SingleCarEntity singleCar;
  final GoogleMapController? mapController;
  final double? latitude;
  final double? longitude;
  final MapType mapType;
  final LatLng? currentLocation;
  const SingleCarState({
    required this.status,
    required this.reserveStatus,
    required this.singleCar,
    this.currentLocation,
    this.mapController,
    this.latitude,
    this.longitude,
    this.mapType = MapType.normal,
  });

  SingleCarState copyWith({
    LoadingStatus? status,
    LoadingStatus? reserveStatus,
    SingleCarEntity? singleCar,
    GoogleMapController? mapController,
    double? latitude,
    double? longitude,
    MapType? mapType,
    LatLng? currentLocation,
  }) {
    return SingleCarState(
      status: status ?? this.status,
      reserveStatus: reserveStatus ?? this.reserveStatus,
      singleCar: singleCar ?? this.singleCar,
      mapController: mapController ?? this.mapController,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      mapType: mapType ?? this.mapType,
      currentLocation: currentLocation ?? this.currentLocation,
    );
  }

  @override
  List<Object?> get props => [
        status,
        singleCar,
        mapController,
        latitude,
        longitude,
        mapType,
        reserveStatus,
        currentLocation,
      ];
}
