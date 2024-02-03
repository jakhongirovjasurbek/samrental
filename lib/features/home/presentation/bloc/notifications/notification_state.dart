// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'notification_bloc.dart';

class NotificationState extends Equatable {
  final LoadingStatus status;
  final List<NotificationEntity> notifications;
  const NotificationState({
    required this.status,
    required this.notifications,
  });

  @override
  List<Object> get props => [status, notifications];

  NotificationState copyWith({
    LoadingStatus? status,
    List<NotificationEntity>? notifications,
  }) {
    return NotificationState(
      status: status ?? this.status,
      notifications: notifications ?? this.notifications,
    );
  }
}
