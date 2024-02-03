import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/exception.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/features/home/data/data_source/network_data_source.dart';
import 'package:samrental/features/home/domain/entites/car.dart';
import 'package:samrental/features/home/domain/entites/notification.dart';
import 'package:samrental/features/home/domain/repositories/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeNetworkDataSource _homeNetworkDataSource;

  HomeRepositoryImpl({required HomeNetworkDataSource dataSource})
      : _homeNetworkDataSource = dataSource;

  @override
  Future<Either<ServerFailure, List<CarEntity>>> getCars() async {
    try {
      final response = await _homeNetworkDataSource.getCars();

      final list = response.data!.cars
          .map((car) => CarEntity(
                images: car.images,
                id: car.id,
                name: car.name,
                title: car.title,
                type: car.type,
                cost: car.cost,
              ))
          .toList();

      return Right(list);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        failureMessage: error.exceptionMessage,
        failureCode: error.exceptionCode,
      ));
    }
  }

  @override
  Future<Either<ServerFailure, List<NotificationEntity>>>
      getNotifications() async {
    try {
      final response = await _homeNetworkDataSource.getNotifications();

      final list = response.map((notification) => notification.entity).toList();

      return Right(list);
    } on ServerException catch (error) {
      return Left(ServerFailure(
        failureMessage: error.exceptionMessage,
        failureCode: error.exceptionCode,
      ));
    }
  }
}
