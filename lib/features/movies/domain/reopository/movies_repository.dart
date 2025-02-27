import 'package:movies/core/index.dart';

abstract class MoviesRepository {
  Future<ApiResult> getNowPlaying(int page);
  Future<ApiResult> getPopular(int page);
  Future<ApiResult> getTopRated(int page);
  Future<ApiResult> getUpcoming(int page);
  Future<ApiResult> getMovieDetails(int movieId);
  Future<ApiResult> getSimilarMovies(int movieId);
  Future<ApiResult> getMovieImages(int movieId);
  Future<ApiResult> getMovieVideos(int movieId);
}
