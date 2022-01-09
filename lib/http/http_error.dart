class NetworkErrorException implements Exception {
  final String? msg;
  NetworkErrorException([this.msg]);
  @override
  String toString() => msg ?? 'Network Error';
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

