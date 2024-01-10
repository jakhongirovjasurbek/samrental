part of 'single_car_bloc.dart';

sealed class SingleCarEvent extends Equatable {
  const SingleCarEvent();

  @override
  List<Object> get props => [];
}

class SingleCarStarted extends SingleCarEvent {
  final String id;
  final ValueChanged<String> onFailure;

  const SingleCarStarted({
    required this.id,
    required this.onFailure,
  });
}

class ReserveCar extends SingleCarEvent {
  final DateTime? startingDate;
  final DateTime? endingDate;
  final String fullName;
  final String phoneNumber;
  final bool? isCash;
  final bool isPickup;
  final double latitude;
  final double longitude;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;
  final int totalCost;

  const ReserveCar({
    required this.startingDate,
    required this.endingDate,
    required this.fullName,
    required this.phoneNumber,
    required this.isCash,
    required this.isPickup,
    required this.latitude,
    required this.longitude,
    required this.totalCost,
    required this.onFailure,
    required this.onSuccess,
  });
}

class SingleCarGetCurrentLocationEvent extends SingleCarEvent {
  final YandexMapController mapController;
  final VoidCallback onSuccess;
  final ValueChanged<String> onFailure;

  const SingleCarGetCurrentLocationEvent({
    required this.mapController,
    required this.onSuccess,
    required this.onFailure,
  });
}

class SingleCarGetSelectedLocation extends SingleCarEvent {
  final double latitude;
  final double longitude;

  const SingleCarGetSelectedLocation({
    required this.latitude,
    required this.longitude,
  });
}

class ChangeMapViewEvent extends SingleCarEvent {
  const ChangeMapViewEvent({
    required this.mapType,
  });

  final MapType mapType;
}

class ZoomInMapEvent extends SingleCarEvent {
  const ZoomInMapEvent();
}

class ZoomOutMapEvent extends SingleCarEvent {
  const ZoomOutMapEvent();
}

class FindMyCurrentLocationEvent extends SingleCarEvent {
  const FindMyCurrentLocationEvent();
}
