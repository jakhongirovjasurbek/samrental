part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class GetAllNotifications extends NotificationEvent {}

class InitializeNotificationConfiguration extends NotificationEvent {
  final ValueChanged<String> onFailure;

  const InitializeNotificationConfiguration({required this.onFailure});
}
