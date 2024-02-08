import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:samrental/core/data/usecase.dart';
import 'package:samrental/features/home/data/data_source/network_data_source.dart';
import 'package:samrental/features/home/data/repositories/home_repository.dart';
import 'package:samrental/features/home/domain/entites/notification.dart';
import 'package:samrental/features/home/domain/usecases/get_notifications.dart';
import 'package:samrental/features/home/domain/usecases/initialize_notification.dart';
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
    on<InitializeNotificationConfiguration>((event, emit) async {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      await messaging.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      final response = await InitializeNotificationConfigurationUseCase(
          repository: HomeRepositoryImpl(
        dataSource: HomeNetworkDataSource(),
      )).call(NoParams());

      response.either(
        (failure) {
          event.onFailure(failure.failureMessage);
        },
        (_) {
          add(GetAllNotifications());
        },
      );
    });
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
