import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class GetMovieImagesUseCase {
  final MoviesRepository _moviesRepository;

  GetMovieImagesUseCase(this._moviesRepository);

  Future<ApiResult> call({required int movieId}) async {
    return await _moviesRepository.getMovieImages(movieId);
  }
}
