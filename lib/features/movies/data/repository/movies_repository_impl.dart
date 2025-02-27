import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesRemoteDataSource _remoteDataSource;
  MoviesRepositoryImpl(this._remoteDataSource);
  @override
  Future<ApiResult> getNowPlaying(int page) async {
    try {
      final response = await _remoteDataSource.getNowPlayingMovies(page);
      return ApiSuccess<MovieResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getPopular(int page) async {
    try {
      final response = await _remoteDataSource.getPopularMovies(page);
      return ApiSuccess<MovieResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getUpcoming(int page) async {
    try {
      final response = await _remoteDataSource.getUpcomingMovies(page);
      return ApiSuccess<MovieResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getTopRated(page) async {
    try {
      final response = await _remoteDataSource.getTopRatedMovies(page);
      return ApiSuccess<MovieResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getMovieDetails(int movieId) async {
    try {
      final movie = await _remoteDataSource.getMovieDetails(movieId);
      return ApiSuccess<MovieDetails>(movie);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getSimilarMovies(int movieId) async {
    try {
      final response = await _remoteDataSource.getSimilarMovies(movieId);
      return ApiSuccess<MovieResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getMovieImages(int movieId) async {
    try {
      final response = await _remoteDataSource.getMovieImages(movieId);
      return ApiSuccess<ImagesResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getMovieVideos(int movieId) async {
    try {
      final response = await _remoteDataSource.getMovieVideos(movieId);
      return ApiSuccess<VideosResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }
}
