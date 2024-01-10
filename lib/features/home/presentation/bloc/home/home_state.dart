part of 'home_bloc.dart';

class HomeState extends Equatable {
  final LoadingStatus status;
  final List<CarEntity> cars;
  final List<CarEntity> allCars;
  final bool? filterStatus;

  const HomeState({
    required this.status,
    required this.cars,
    required this.allCars,
    this.filterStatus = false,
  });

  HomeState copyWith({
    LoadingStatus? status,
    List<CarEntity>? cars,
    List<CarEntity>? allCars,
    bool? filterStatus,
  }) =>
      HomeState(
        status: status ?? this.status,
        cars: cars ?? this.cars,
        allCars: allCars ?? this.allCars,
        filterStatus: filterStatus ?? this.filterStatus,
      );

  @override
  List<Object?> get props => [status, cars, allCars, filterStatus];
}

enum LoadingStatus {
  pure,
  loading,
  loadedWithSuccess,
  loadedWithFailure,
}
