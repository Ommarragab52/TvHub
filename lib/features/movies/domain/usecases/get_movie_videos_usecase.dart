import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class GetMovieVideosUseCase {
  final MoviesRepository _moviesRepository;

  GetMovieVideosUseCase(this._moviesRepository);

  Future<ApiResult> call(int movieId) async {
    return await _moviesRepository.getMovieVideos(movieId);
  }
}
