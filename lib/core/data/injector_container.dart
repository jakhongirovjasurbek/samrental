import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:samrental/features/cars/data/repository/car.dart';
import 'package:samrental/features/cars/data_source/car_remote.dart';
import 'package:samrental/features/cars/domain/usecase/get_single_car.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  serviceLocator.registerLazySingleton(() => Dio(
        BaseOptions(baseUrl: 'http://164.92.117.144:2021/v1'),
      ));

  serviceLocator.registerLazySingleton(() => GetSingleCarUseCase(
        repository: CarRepositoryImpl(remoteDataSource: CarRemoteDataSource()),
      ));
}
