import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/core/data/usecase.dart';
import 'package:samrental/features/cars/domain/entity/reserve.dart';
import 'package:samrental/features/cars/domain/repository/car.dart';

class ReserveCarUseCase implements UseCase<void, ReserveEntity> {
  final CarRepository repository;

  const ReserveCarUseCase({required this.repository});
  @override
  Future<Either<Failure, void>> call(ReserveEntity params) async {
    return await repository.reserveCar(params);
  }
}
