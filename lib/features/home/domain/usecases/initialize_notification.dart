import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/core/data/usecase.dart';
import 'package:samrental/features/home/domain/repositories/home_repository.dart';

class InitializeNotificationConfigurationUseCase
    implements UseCase<void, NoParams> {
  final HomeRepository _repository;

  const InitializeNotificationConfigurationUseCase({
    required HomeRepository repository,
  }) : _repository = repository;

  @override
  Future<Either<Failure, void>> call(
    NoParams params,
  ) async {
    return _repository.initializeNotificationConfiguration();
  }
}
