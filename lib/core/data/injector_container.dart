import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:samrental/features/cars/data/repository/car.dart';
import 'package:samrental/features/cars/domain/usecase/get_single_car.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/cars/data/data_source/car_remote.dart';
import '../../features/cars/domain/usecase/reserve_car.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton(() => Dio(
        BaseOptions(baseUrl: 'http://164.92.117.144:2021/v1'),
      ));

  serviceLocator.registerLazySingleton(() => GetSingleCarUseCase(
        repository: CarRepositoryImpl(remoteDataSource: CarRemoteDataSource()),
      ));

  serviceLocator.registerLazySingleton(() => ReserveCarUseCase(
        repository: CarRepositoryImpl(remoteDataSource: CarRemoteDataSource()),
      ));

  serviceLocator.registerSingletonAsync(
      () async => await SharedPreferences.getInstance());
}
