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
        // bool serviceEnabled;
        LocationPermission permission;

        // Test if location services are enabled.
        // serviceEnabled = await Geolocator.isLocationServiceEnabled();
        permission = await Geolocator.requestPermission();
        // if (!serviceEnabled) {
        //   // Location services are not enabled don't continue
        //   // accessing the position and request users of the
        //   // App to enable the location services.
        //   return Future.error('Location services are disabled.');
        // }

        permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            // Permissions are denied, next time you could try
            // requesting permissions again (this is also where
            // Android's shouldShowRequestPermissionRationale
            // returned true. According to Android guidelines
            // your App should show an explanatory UI now.
            return Future.error('Location permissions are denied');
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.',
          );
        }

        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best,
          // forceAndroidLocationManager: true,
        );

        emit(state.copyWith());

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
  }
}
