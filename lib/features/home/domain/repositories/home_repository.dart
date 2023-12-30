import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/features/home/domain/entites/car.dart';

abstract class HomeRepository {

  Future<Either<ServerFailure, List<CarEntity>>> getCars();
}