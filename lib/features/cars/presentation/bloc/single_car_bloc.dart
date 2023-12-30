import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:samrental/core/data/injector_container.dart';
import 'package:samrental/features/cars/domain/entity/car.dart';
import 'package:samrental/features/cars/domain/usecase/get_single_car.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';

part 'single_car_event.dart';
part 'single_car_state.dart';

class SingleCarBloc extends Bloc<SingleCarEvent, SingleCarState> {
  SingleCarBloc()
      : super(
          const SingleCarState(
            status: LoadingStatus.pure,
            singleCar: SingleCarEntity(),
          ),
        ) {
    on<SingleCarStarted>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      final response =
          await serviceLocator<GetSingleCarUseCase>().call(event.id);

      response.either((failure) {
        emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        event.onFailure(failure.failureMessage);
      }, (car) {
        emit(state.copyWith(
          status: LoadingStatus.loadedWithSuccess,
          singleCar: car,
        ));
      });
    });
  }
}
