class ReserveEntity {
  final DateTime startingDate;
  final DateTime endingDate;
  final String fullName;
  final String phoneNumber;
  final bool isCash;
  final bool isPickup;
  final double latitude;
  final double longitude;
  final String carId;
  final int totalCost;
  const ReserveEntity({
    required this.startingDate,
    required this.endingDate,
    required this.fullName,
    required this.phoneNumber,
    required this.isCash,
    required this.isPickup,
    required this.latitude,
    required this.longitude,
    required this.carId,
    required this.totalCost,
  });
}
