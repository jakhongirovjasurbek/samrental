import 'package:samrental/core/data/failure.dart';
import 'package:samrental/features/cars/domain/entity/car.dart';

import '../../../../core/data/either.dart';

abstract class CarRepository {
  Future<Either<ServerFailure, SingleCarEntity>> getSingleCar(String id);
}
