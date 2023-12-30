import 'package:dio/dio.dart';
import 'package:samrental/core/data/exception.dart';
import 'package:samrental/core/data/injector_container.dart';

import '../models/car_response/car_response.dart';

abstract class HomeNetworkDataSource {
  Future<CarResponseModel> getCars();

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
      throw ServerException(exceptionMessage: 'Some error happened');
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(exceptionMessage: "$error");
    }
  }
}
