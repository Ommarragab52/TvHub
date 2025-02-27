import 'package:dio/dio.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/movies/index.dart';

abstract class MoviesRemoteDataSource {
  Future<MovieResponseModel> getNowPlayingMovies(int page);
  Future<MovieResponseModel> getPopularMovies(int page);
  Future<MovieResponseModel> getTopRatedMovies(int page);
  Future<MovieResponseModel> getUpcomingMovies(int page);
  Future<MovieResponseModel> getSimilarMovies(int id);
  Future<MovieDetailsModel> getMovieDetails(int id);
  Future<ImagesReponseModel> getMovieImages(int id);
  Future<VideosResponseModel> getMovieVideos(int id);
}

class MoviesRemoteDataSourceImpl implements MoviesRemoteDataSource {
  final Dio dio;
  MoviesRemoteDataSourceImpl(this.dio);
  @override
  Future<MovieResponseModel> getNowPlayingMovies(int page) async {
    final response = await dio.get(
      ApiConstants.playingNowMoviesEP,
      queryParameters: {'page': page},
    );
    final moviesResponse = MovieResponseModel.fromJson(response.data);
    return moviesResponse;
  }

  @override
  Future<MovieResponseModel> getPopularMovies(int page) async {
    final response = await dio.get(
      ApiConstants.popularMoviesEP,
      queryParameters: {'page': page},
    );
    final moviesResponse = MovieResponseModel.fromJson(response.data);
    return moviesResponse;
  }

  @override
  Future<MovieResponseModel> getUpcomingMovies(int page) async {
    final response = await dio.get(
      ApiConstants.upcomingMoviesEP,
      queryParameters: {'page': page},
    );
    final moviesResponse = MovieResponseModel.fromJson(response.data);
    return moviesResponse;
  }

  @override
  Future<MovieResponseModel> getTopRatedMovies(int page) async {
    final response = await dio.get(
      ApiConstants.topRatedMoviesEP,
      queryParameters: {'page': page},
    );
    final moviesResponse = MovieResponseModel.fromJson(response.data);
    return moviesResponse;
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final response = await dio.get(ApiConstants.movieDetails(id));
    return MovieDetailsModel.fromJson(response.data);
  }

  @override
  Future<MovieResponseModel> getSimilarMovies(int id) async {
    final response = await dio.get(ApiConstants.similarMovies(id));
    return MovieResponseModel.fromJson(response.data);
  }

  @override
  Future<ImagesReponseModel> getMovieImages(int id) async {
    final response =
        await dio.get(ApiConstants.getMovieImages(id), queryParameters: {
      'language':
          SharedPrefHelper.getString(SharedPrefKeys.language.substring(0, 2)),
      'region': ''
    });
    return ImagesReponseModel.fromJson(response.data);
  }

  @override
  Future<VideosResponseModel> getMovieVideos(int id) async {
    final response =
        await dio.get(ApiConstants.getMovieVideos(id), queryParameters: {
      'language':
          SharedPrefHelper.getString(SharedPrefKeys.language.substring(0, 2)),
      'region': ''
    });
    return VideosResponseModel.fromJson(response.data);
  }
}
