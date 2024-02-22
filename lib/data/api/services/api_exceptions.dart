class ApplicationErrorException implements Exception {
  final dynamic message;
  final String prefix;

  ApplicationErrorException(this.message, this.prefix);

  @override
  String toString() {
    return '$prefix$message';
  }
}

class DataFetchException extends ApplicationErrorException {
  DataFetchException([String? message]) : super(message, '');
}

class BadRequestException extends ApplicationErrorException {
  BadRequestException([String? message]) : super(message, '');
}

class UnauthorizedRequestException extends ApplicationErrorException {
  UnauthorizedRequestException([String? message])
      : super(message, '');
}

class ForbiddenRequestException extends ApplicationErrorException {
  ForbiddenRequestException([String? message])
      : super(message, 'Forbidden: ');
}

class NotFoundRequestException extends ApplicationErrorException {
  NotFoundRequestException([String? message]) : super(message, 'Not found: ');
}

class InternalServerErrorException extends ApplicationErrorException {
  InternalServerErrorException([String? message])
      : super(message, '');
}
