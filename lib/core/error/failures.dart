abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message);
}

class ExceptionHandler {
  static Failure handle(dynamic error) {
    if (error is Exception) {
      if (error is FormatException) {
        return const ServerFailure('Invalid data format received.');
      }
      return UnknownFailure(error.toString());
    } else {
      return UnknownFailure('An unexpected error occurred: $error');
    }
  }
}
