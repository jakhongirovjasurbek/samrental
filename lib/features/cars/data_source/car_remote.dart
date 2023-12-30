import 'package:dio/dio.dart';
import 'package:samrental/core/data/exception.dart';
import 'package:samrental/features/cars/data/models/single_car.dart';

import '../../../core/data/injector_container.dart';

abstract class CarRemoteDataSource {
  factory CarRemoteDataSource() => _CarRemoteDataSourceImpl();

  Future<SingleCarModel> getCar(String id);
}

class _CarRemoteDataSourceImpl implements CarRemoteDataSource {
  @override
  Future<SingleCarModel> getCar(String id) async {
    final dio = serviceLocator<Dio>();
    try {
      final response = await dio.get('/mobilecar/$id');

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return SingleCarModel.fromJson(response.data['data']['car']);
      } else {
        throw ServerException(
          exceptionMessage: 'Server failed to respond',
          exceptionCode: '403',
        );
      }
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(exceptionMessage: "$error", exceptionCode: '141');
    }
  }
}
