import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/core/data/usecase.dart';
import 'package:samrental/features/home/domain/entites/car.dart';
import 'package:samrental/features/home/domain/repositories/home_repository.dart';

class GetCarsUseCase implements UseCase<List<CarEntity>, NoParams> {
  final HomeRepository _repository;

  const GetCarsUseCase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<CarEntity>>> call(NoParams params) async {
    return _repository.getCars();
  }
}
