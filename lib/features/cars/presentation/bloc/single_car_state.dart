part of 'single_car_bloc.dart';

class SingleCarState extends Equatable {
  final LoadingStatus status;
  final SingleCarEntity singleCar;

  const SingleCarState({
    required this.status,
    required this.singleCar,
  });

  SingleCarState copyWith({
    LoadingStatus? status,
    SingleCarEntity? singleCar,
  }) =>
      SingleCarState(
        status: status ?? this.status,
        singleCar: singleCar ?? this.singleCar,
      );

  @override
  List<Object> get props => [status, singleCar];
}
