part of 'home_bloc.dart';

sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeStarted extends HomeEvent {
  final ValueChanged<String> onFailure;

  const HomeStarted({required this.onFailure});
}
