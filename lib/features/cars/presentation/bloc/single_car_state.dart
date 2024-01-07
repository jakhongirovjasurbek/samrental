// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'single_car_bloc.dart';

class SingleCarState extends Equatable {
  final LoadingStatus status;
  final SingleCarEntity singleCar;
  final double? latitude;
  final double? longitude;
  const SingleCarState({
    required this.status,
    required this.singleCar,
    this.latitude,
    this.longitude,
  });

  SingleCarState copyWith({
    LoadingStatus? status,
    SingleCarEntity? singleCar,
    double? latitude,
    double? longitude,
  }) {
    return SingleCarState(
      status: status ?? this.status,
      singleCar: singleCar ?? this.singleCar,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }

  @override
  List<Object?> get props => [status, singleCar, latitude, longitude];
}
