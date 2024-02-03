part of 'home_bloc.dart';

class HomeState extends Equatable {
  final LoadingStatus status;
  final List<CarEntity> cars;
  final List<CarEntity> allCars;
  final List<String> selectedTypes;
  

  @override
  List<Object?> get props => [status, cars, allCars, selectedTypes];

  const HomeState({
    required this.status,
    required this.cars,
    required this.allCars,
    required this.selectedTypes,
  });

  HomeState copyWith({
    LoadingStatus? status,
    List<CarEntity>? cars,
    List<CarEntity>? allCars,
    List<String>? selectedTypes,
  }) {
    return HomeState(
      status: status ?? this.status,
      cars: cars ?? this.cars,
      allCars: allCars ?? this.allCars,
      selectedTypes: selectedTypes ?? this.selectedTypes,
    );
  }
}

enum LoadingStatus {
  pure,
  loading,
  loadedWithSuccess,
  loadedWithFailure,
}
