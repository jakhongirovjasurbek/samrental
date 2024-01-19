import 'package:samrental/core/data/failure.dart';
import 'package:samrental/features/cars/domain/entity/car.dart';

import '../../../../core/data/either.dart';
import '../entity/reserve.dart';

abstract class CarRepository {
  Future<Either<ServerFailure, SingleCarEntity>> getSingleCar(String id);
  Future<Either<ServerFailure, void>> reserveCar(ReserveEntity reservation);
}
