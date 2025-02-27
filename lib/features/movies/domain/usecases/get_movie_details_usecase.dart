import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class GetMovieDetailsUseCase {
  final MoviesRepository _moviesRepository;
  const GetMovieDetailsUseCase(this._moviesRepository);

  Future<ApiResult> call(int movieId) async {
    final result = await _moviesRepository.getMovieDetails(movieId);
    switch (result) {
      case ApiSuccess():
        return ApiSuccess(result.data);
      case ApiError():
        return ApiError(result.faliure);
    }
  }
}
