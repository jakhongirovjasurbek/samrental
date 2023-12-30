part of 'home_bloc.dart';

class HomeState extends Equatable {
  final LoadingStatus status;
  final List<CarEntity> cars;
  const HomeState({
    required this.status,
    required this.cars,
  });

  HomeState copyWith({
    LoadingStatus? status,
    List<CarEntity>? cars,
  }) =>
      HomeState(
        status: status ?? this.status,
        cars: cars ?? this.cars,
      );

  @override
  List<Object> get props => [status, cars];
}

enum LoadingStatus {
  pure,
  loading,
  loadedWithSuccess,
  loadedWithFailure,
}
