part of 'single_car_bloc.dart';

sealed class SingleCarEvent extends Equatable {
  const SingleCarEvent();

  @override
  List<Object> get props => [];
}

class SingleCarStarted extends SingleCarEvent {
  final String id;
  final ValueChanged<String> onFailure;

  const SingleCarStarted({
    required this.id,
    required this.onFailure,
  });
}
