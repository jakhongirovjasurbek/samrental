import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/exception.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/features/cars/domain/entity/car.dart';
import 'package:samrental/features/cars/domain/entity/reserve.dart';
import 'package:samrental/features/cars/domain/repository/car.dart';

import '../data_source/car_remote.dart';

class CarRepositoryImpl implements CarRepository {
  final CarRemoteDataSource remoteDataSource;

  CarRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<ServerFailure, SingleCarEntity>> getSingleCar(
      String id) async {
    try {
      final car = await remoteDataSource.getCar(id);
      return Right(car);
    } on ServerException catch (exception) {
      return Left(ServerFailure(
        failureMessage: exception.exceptionMessage,
        failureCode: exception.exceptionCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, void>> reserveCar(ReserveEntity reservation) async {
    try {
      final response = await remoteDataSource.reserveCar(reservation);
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(failureMessage: e.exceptionMessage, failureCode: e.exceptionCode));
    }
  }
}
