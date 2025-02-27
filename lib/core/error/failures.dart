abstract class Failure {
  final int code;
  Failure({required this.code});
}

class ServerFailure extends Failure {
  ServerFailure({required super.code});
}

class CacheFailure extends Failure {
  CacheFailure({required super.code});
}
