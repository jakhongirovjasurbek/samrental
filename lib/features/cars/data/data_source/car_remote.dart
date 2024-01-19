import 'package:dio/dio.dart';
import 'package:samrental/core/data/exception.dart';
import 'package:samrental/features/cars/data/models/single_car.dart';
import 'package:samrental/features/cars/domain/entity/reserve.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../core/data/injector_container.dart';


abstract class CarRemoteDataSource {
  factory CarRemoteDataSource() => _CarRemoteDataSourceImpl();

  Future<SingleCarModel> getCar(String id);

  Future<void> reserveCar(ReserveEntity reserve);
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

  @override
  Future<void> reserveCar(ReserveEntity reserve) async {
    final dio = serviceLocator<Dio>();
    try {
      if (!reserve.isCash) {
        await launchUrlString(
          'https://payme.uz/fallback/merchant/?id=659ced854de4489c5e27c207&payment_info=${reserve.fullName}&amount=${reserve.totalCost}00',
        );
      }
      // print('Came here');
      // final paymentResponse = await dio.post('https://checkout.paycom.uz',
      //     data: FormData.fromMap(
      //       {
      //         "merchant": "6598fc505c8188fb6e91fc46",
      //         "amount": "${reserve.totalCost}00",
      //         "account[payment_info]": "test"
      //       },
      //     ));
      // print(paymentResponse.statusCode);
      // print(paymentResponse.realUri);
      // print(paymentResponse.requestOptions.data);
      // print(paymentResponse.data);
      // print('Came here 2');
      final response = await dio.post(
        '/order/create',
        data: {
          "car_id": reserve.carId,
          "starting_date":
              reserve.startingDate.toUtc().millisecondsSinceEpoch ~/ 1000,
          "ending_date":
              reserve.endingDate.toUtc().millisecondsSinceEpoch ~/ 1000,
          "full_name": reserve.fullName,
          "phone": reserve.phoneNumber,
          "cash": reserve.isCash,
          "method": reserve.isPickup ? "pickup" : "delivery",
          "lat": "${reserve.latitude}",
          "long": "${reserve.longitude}",
          "total_cost": reserve.totalCost,
        },
      );

      print(response.statusCode);
      print(response.realUri);
      print(response.requestOptions.data);
      print(response.data);

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return;
      } else {
        throw ServerException(
          exceptionMessage: 'Server failed to respond',
          exceptionCode: '403',
        );
      }
    } on DioException catch (error) {
      print(error.message);
      print(error.response!.data);
      throw ServerException(exceptionMessage: "$error", exceptionCode: '141');
    } on ServerException {
      rethrow;
    } catch (error) {
      throw ServerException(exceptionMessage: "$error", exceptionCode: '141');
    }
  }
}
