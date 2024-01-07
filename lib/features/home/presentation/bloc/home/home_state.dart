part of 'home_bloc.dart';

class HomeState extends Equatable {
  final LoadingStatus status;
  final List<CarEntity> cars;
  final List<CarEntity> allCars;
  const HomeState({
    required this.status,
    required this.cars,
    required this.allCars,
  });

  HomeState copyWith({
    LoadingStatus? status,
    List<CarEntity>? cars,
    List<CarEntity>? allCars,
  }) =>
      HomeState(
        status: status ?? this.status,
        cars: cars ?? this.cars,
        allCars: allCars ?? this.allCars,
      );

  @override
  List<Object> get props => [status, cars, allCars];
}

enum LoadingStatus {
  pure,
  loading,
  loadedWithSuccess,
  loadedWithFailure,
}
