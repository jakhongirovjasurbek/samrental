part of 'filter_bloc.dart';

sealed class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class SelectCarTypesEvent extends FilterEvent {
  final CarsType type;

  const SelectCarTypesEvent({required this.type});
}

class FilterButtonPressedEvent extends FilterEvent {
  final List<CarEntity> cars;

  const FilterButtonPressedEvent({required this.cars});
}
