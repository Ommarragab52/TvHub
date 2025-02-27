import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class TvSeriesRepositoryImpl implements TvSeriesRepository {
  final TvSeriesRemoteDataSource _tvSeriesRemoteDataSource;
  TvSeriesRepositoryImpl(this._tvSeriesRemoteDataSource);
  @override
  Future<ApiResult> getAiringTodayTvSeries(int page) async {
    try {
      final response =
          await _tvSeriesRemoteDataSource.getAiringTodayTvSeries(page);
      return ApiSuccess<TvSeriesResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getOnTheAirTvSeries(int page) async {
    try {
      final response =
          await _tvSeriesRemoteDataSource.getOnTheAirTvSeries(page);
      return ApiSuccess<TvSeriesResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getPopularTvSeries(int page) async {
    try {
      final response = await _tvSeriesRemoteDataSource.getPopularTvSeries(page);
      return ApiSuccess<TvSeriesResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getTopRatedTvSeries(page) async {
    try {
      final response =
          await _tvSeriesRemoteDataSource.getTopRatedTvSeries(page);
      return ApiSuccess<TvSeriesResponse>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getTvDetails(int id) async {
    try {
      final response = await _tvSeriesRemoteDataSource.getTvDetails(id);
      return ApiSuccess<TvDetails>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getTvSeasonEpisodes(int id, int seasonNumber) async {
    try {
      final response =
          await _tvSeriesRemoteDataSource.getTvSeasonEpisodes(id, seasonNumber);
      return ApiSuccess<List<Episode>>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }

  @override
  Future<ApiResult> getSimilarTvSeries(int id) async {
    try {
      final response = await _tvSeriesRemoteDataSource.getSimilarTvSeries(id);
      return ApiSuccess<List<TvSeries>>(response);
    } catch (e) {
      return ApiError(ErrorHandler.handle(e));
    }
  }
}
