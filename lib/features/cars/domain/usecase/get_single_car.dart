import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/core/data/usecase.dart';
import 'package:samrental/features/cars/domain/entity/car.dart';
import 'package:samrental/features/cars/domain/repository/car.dart';

class GetSingleCarUseCase implements UseCase<SingleCarEntity, String> {
  final CarRepository repository;

  const GetSingleCarUseCase({required this.repository});
  @override
  Future<Either<Failure, SingleCarEntity>> call(String params) async {
    return await repository.getSingleCar(params);
  }
}
