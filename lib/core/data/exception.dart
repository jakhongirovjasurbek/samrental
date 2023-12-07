class ServerException implements Exception {
  final String exceptionMessage;
  final String? exceptionCode;

  ServerException({
    required this.exceptionMessage,
    this.exceptionCode,
  });

  factory ServerException.fromJson(Map<String, dynamic> json) =>
      // TODO: Implement exception parsing coming from server
      ServerException(exceptionMessage: '');
}

class CacheException implements Exception {
  final String exceptionMessage;

  CacheException({required this.exceptionMessage});
}
