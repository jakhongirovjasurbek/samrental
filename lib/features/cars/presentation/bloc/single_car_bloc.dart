import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:samrental/core/data/injector_container.dart';
import 'package:samrental/features/cars/domain/entity/car.dart';
import 'package:samrental/features/cars/domain/usecase/get_single_car.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

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

    on<SingleCarGetCurrentLocationEvent>((event, emit) async {
      try {
        LocationPermission permission;
        permission = await Geolocator.requestPermission();
        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            return Future.error('Location permissions are denied');
          }
        }

        if (permission == LocationPermission.deniedForever) {
          return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.',
          );
        }

        Position position = await Geolocator.getCurrentPosition();

        emit(
          state.copyWith(
            mapController: event.mapController,
            animation: const MapAnimation(
              type: MapAnimationType.linear,
              duration: 1,
            ),
          ),
        );

        event.mapController.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: Point(
                latitude: position.latitude,
                longitude: position.longitude,
              ),
              zoom: 18,
            ),
          ),
          animation: const MapAnimation(
            type: MapAnimationType.linear,
            duration: 1,
          ),
        );
      } catch (error) {
        print(error);
      }
    });

    on<SingleCarGetSelectedLocation>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangeMapViewEvent>((event, emit) {
      emit(state.copyWith(mapType: event.mapType));
    });

    on<ZoomInMapEvent>((event, emit) {
      state.mapController?.moveCamera(
        animation: state.animation,
        CameraUpdate.zoomIn(),
      );
    });

    on<ZoomOutMapEvent>((event, emit) {
      state.mapController?.moveCamera(
        animation: state.animation,
        CameraUpdate.zoomOut(),
      );
    });

    on<FindMyCurrentLocationEvent>((event, emit) async {
      Position position = await Geolocator.getCurrentPosition();

      await state.mapController?.moveCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: Point(
              latitude: position.latitude,
              longitude: position.longitude,
            ),
          ),
        ),
        animation: state.animation,
      );
      emit(
        state.copyWith(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );
    });
  }
}
