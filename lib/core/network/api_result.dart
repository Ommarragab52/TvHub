import 'package:movies/core/error/failures.dart';

sealed class ApiResult {}

class ApiSuccess<T> extends ApiResult {
  final T data;
  ApiSuccess(this.data);
}

class ApiError extends ApiResult {
  final Failure faliure;
  ApiError(this.faliure);
}
