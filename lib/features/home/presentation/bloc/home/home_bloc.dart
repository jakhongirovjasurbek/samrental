import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:samrental/core/data/usecase.dart';
import 'package:samrental/features/home/data/data_source/network_data_source.dart';
import 'package:samrental/features/home/data/repositories/home_repository.dart';
import 'package:samrental/features/home/domain/entites/car.dart';
import 'package:samrental/features/home/domain/usecases/get_news.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc()
      : super(const HomeState(
          status: LoadingStatus.pure,
          cars: [],
        )) {
    on<HomeStarted>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.pure));
      final usecase = GetCarsUseCase(
        repository: HomeRepositoryImpl(
          dataSource: HomeNetworkDataSource(),
        ),
      );

      final response = await usecase.call(NoParams());

      response.either(
        (failure) {
          emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
          event.onFailure(failure.failureMessage);
        },
        (cars) {
          emit(state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            cars: cars,
          ));
        },
      );
    });
  }
}
