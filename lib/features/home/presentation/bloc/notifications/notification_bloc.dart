import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:samrental/core/data/usecase.dart';
import 'package:samrental/features/home/data/data_source/network_data_source.dart';
import 'package:samrental/features/home/data/repositories/home_repository.dart';
import 'package:samrental/features/home/domain/entites/notification.dart';
import 'package:samrental/features/home/domain/usecases/get_notifications.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc()
      : super(
          const NotificationState(
            status: LoadingStatus.pure,
            notifications: [],
          ),
        ) {
    on<GetAllNotifications>((event, emit) async {
      emit(state.copyWith(status: LoadingStatus.loading));

      final response = await GetNotificationsUseCase(
          repository: HomeRepositoryImpl(
        dataSource: HomeNetworkDataSource(),
      )).call(NoParams());

      response.either(
        (failure) {
          emit(state.copyWith(status: LoadingStatus.loadedWithFailure));
        },
        (notifications) {
          emit(state.copyWith(
            status: LoadingStatus.loadedWithSuccess,
            notifications: notifications,
          ));
        },
      );
    });
  }
}
