part of 'filter_bloc.dart';

class FilterState extends Equatable {
  final FilterLoadingStatus status;
  final List<CarEntity> cars;
  final bool allTypeCars;
  final bool? standardType;
  final bool? comfortType;
  final bool? businessType;

  const FilterState({
    required this.status,
    required this.cars,
    required this.allTypeCars,
    this.standardType,
    this.comfortType,
    this.businessType,
  });

  FilterState copyWith({
    FilterLoadingStatus? status,
    List<CarEntity>? cars,
    bool? allTypeCars,
    bool? standardType,
    bool? comfortType,
    bool? businessType,
  }) =>
      FilterState(
        status: status ?? this.status,
        cars: cars ?? this.cars,
        allTypeCars: allTypeCars ?? this.allTypeCars,
        standardType: standardType ?? this.standardType,
        comfortType: comfortType ?? this.comfortType,
        businessType: businessType ?? this.businessType,
      );

  @override
  List<Object?> get props => [
        status,
        cars,
        allTypeCars,
        standardType,
        comfortType,
        businessType,
      ];
}

enum FilterLoadingStatus {
  pure,
  loading,
  loadedWithSuccess,
  loadedWithFailure,
}

enum CarsType {
  allCars,
  standardType,
  comfortType,
  businessType,
}
