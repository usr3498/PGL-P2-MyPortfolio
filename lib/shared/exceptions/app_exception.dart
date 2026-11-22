abstract class AppException implements Exception {
  final String message;
  final dynamic originalError;
  final StackTrace? stackTrace;

  AppException({required this.message, this.originalError, this.stackTrace});

  @override
  String toString() => message;
}

class AppNetworkException extends AppException {
  AppNetworkException({
    super.message = 'Sin conexión a internet o servidor inaccesible.',
    super.originalError,
    super.stackTrace,
  });
}

class AppTimeoutException extends AppException {
  AppTimeoutException({
    super.message =
        'El servidor tardó demasiado en responder. Inténtalo de nuevo en unos segundos.',
    super.originalError,
    super.stackTrace,
  });
}

class BadRequestException extends AppException {
  BadRequestException({required super.message, super.originalError, super.stackTrace});
}

class UnauthorizedException extends AppException {
  UnauthorizedException({required super.message, super.originalError, super.stackTrace});
}

class NotFoundException extends AppException {
  NotFoundException({required super.message, super.originalError, super.stackTrace});
}

class ConflictException extends AppException {
  ConflictException({required super.message, super.originalError, super.stackTrace});
}

class ServerException extends AppException {
  ServerException({required super.message, super.originalError, super.stackTrace});
}