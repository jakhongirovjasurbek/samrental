import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/exception.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/features/cars/data_source/car_remote.dart';
import 'package:samrental/features/cars/domain/entity/car.dart';
import 'package:samrental/features/cars/domain/repository/car.dart';

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
}
