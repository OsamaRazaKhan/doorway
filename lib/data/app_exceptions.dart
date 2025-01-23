class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  String toString() {
    return '$_prefix $_message';
  }
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Bad Request!');
}

class UnauthorisedException extends AppException {
  UnauthorisedException([String? message])
      : super(message, 'Unauthorised Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input!');
}

class CustomTimeoutException extends AppException {
  CustomTimeoutException([String? message]) : super(message, 'Time out!');
}

class CustomHandShakeException extends AppException {
  CustomHandShakeException([String? message])
      : super(message, 'Handshake Error!');
}

class ConflictException extends AppException {
  ConflictException([String? message]) : super(message, 'Conflict!');
}
