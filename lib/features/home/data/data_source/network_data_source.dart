import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:samrental/core/data/exception.dart';
import 'package:samrental/core/data/injector_container.dart';
import 'package:samrental/core/data/storage_repository.dart';
import 'package:samrental/features/home/data/models/notification/notification.dart';
import 'package:samrental/generated/locale_keys.g.dart';

import '../models/car_response/car_response.dart';

abstract class HomeNetworkDataSource {
  Future<CarResponseModel> getCars();

  Future<List<NotificationModel>> getNotifications();
  Future<void> initializeNotificationConfiguration();

  factory HomeNetworkDataSource() => _HomeNetworkDataSourceImpl();
}

class _HomeNetworkDataSourceImpl implements HomeNetworkDataSource {
  @override
  Future<CarResponseModel> getCars() async {
    final dio = serviceLocator<Dio>();

    try {
      final response = await dio.get('/mobilecar/all');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final rawData = CarResponseModel.fromJson(response.data);

        return rawData;
      }
      throw ServerException(exceptionMessage: LocaleKeys.internal_error);
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(exceptionMessage: "$error");
    }
  }

  @override
  Future<List<NotificationModel>> getNotifications() async {
    final dio = serviceLocator<Dio>();

    try {
      final response = await dio.get('/notification/all');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        final rawData = (response.data['notifications'] as List)
            .map((notification) => NotificationModel.fromJson(notification))
            .toList();

        return rawData;
      }
      throw ServerException(exceptionMessage: LocaleKeys.internal_error);
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(exceptionMessage: "$error");
    }
  }

  @override
  Future<void> initializeNotificationConfiguration() async {
    try {
      await StorageRepository.getInstance();
      final dio = serviceLocator<Dio>();

      String? token = await FirebaseMessaging.instance.getToken();

      if (token != null) {
        await StorageRepository.putString('fcm_token', token);
      }

      if (StorageRepository.getString('fcm_token').isEmpty ||
          StorageRepository.getString('fcm_token') != token) {
        if (token != null) {
          await dio.post('/user/create', data: {'fcm_token': token});
          return;
        }
      }
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(exceptionMessage: "$error");
    }
  }
}
