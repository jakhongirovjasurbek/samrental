import 'package:samrental/core/data/either.dart';
import 'package:samrental/core/data/failure.dart';
import 'package:samrental/core/data/usecase.dart';
import 'package:samrental/features/home/domain/entites/notification.dart';
import 'package:samrental/features/home/domain/repositories/home_repository.dart';

class GetNotificationsUseCase
    implements UseCase<List<NotificationEntity>, NoParams> {
  final HomeRepository _repository;

  const GetNotificationsUseCase({required HomeRepository repository})
      : _repository = repository;

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(
    NoParams params,
  ) async {
    return _repository.getNotifications();
  }
}
