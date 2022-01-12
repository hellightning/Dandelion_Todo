class NetworkErrorException implements Exception {
  final String? msg;
  NetworkErrorException([this.msg]);
  @override
  String toString() => msg ?? 'Network Error';
}

class LoginFailedException implements Exception {
  final String? msg;
  LoginFailedException([this.msg]);
  @override
  String toString() => msg ?? 'Wrong User id or Password';
}

class InvalidInputException implements Exception {
  final String? msg;
  InvalidInputException([this.msg]);
  @override
  String toString() => msg ?? 'Invalid Input';
}

class SessionOutOfDateException implements Exception {
  final String? msg;
  SessionOutOfDateException([this.msg]);
  @override
  String toString() => msg ?? 'Session Out of date';
}

