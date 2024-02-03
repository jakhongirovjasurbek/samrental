// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: json['_id'] as String?,
      body: json['body'] as String?,
      title: json['title'] as String?,
      createdAt: json['created_at'] as int?,
      v: json['__v'] as int?,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'body': instance.body,
      'title': instance.title,
      'created_at': instance.createdAt,
      '__v': instance.v,
    };
