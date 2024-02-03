import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: "_id")
  String? id;
  @JsonKey(name: "body")
  String? body;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "created_at")
  int? createdAt;
  @JsonKey(name: "__v")
  int? v;

  NotificationModel({
    this.id,
    this.body,
    this.title,
    this.createdAt,
    this.v,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
