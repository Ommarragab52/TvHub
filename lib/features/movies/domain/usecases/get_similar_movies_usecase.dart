import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class GetSimilarMoviesUseCase {
  final MoviesRepository _moviesRepository;

  const GetSimilarMoviesUseCase(this._moviesRepository);

  Future<ApiResult> call(int movieId) async {
    return await _moviesRepository.getSimilarMovies(movieId);
  }
}
