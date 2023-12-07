abstract class Failure {
  final String failureMessage;

  Failure({required this.failureMessage});
}

class ServerFailure extends Failure {
  final String? failureCode;
  ServerFailure({
    required super.failureMessage,
    this.failureCode,
  });

}

class CacheFailure extends Failure {
  CacheFailure({
    required super.failureMessage,
  });
}
