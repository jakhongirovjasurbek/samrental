import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/features/home/domain/entites/car.dart';
import 'package:samrental/features/home/domain/entites/notification.dart';

abstract class HomeRepository {
  Future<Either<ServerFailure, List<CarEntity>>> getCars();
  Future<Either<ServerFailure, void>> initializeNotificationConfiguration();

  Future<Either<ServerFailure, List<NotificationEntity>>> getNotifications();
}
