import 'package:samrental/features/home/data/models/notification/notification.dart';

class NotificationEntity {
  final String id;
  final String body;
  final String title;
  final int createdAt;

  const NotificationEntity({
    required this.id,
    required this.body,
    required this.title,
    required this.createdAt,
  });
}

extension NotificationModelX on NotificationModel {
  NotificationEntity get entity {
    return NotificationEntity(
      id: id ?? '',
      body: body ?? '',
      title: title ?? '',
      createdAt: createdAt ?? 0,
    );
  }
}
