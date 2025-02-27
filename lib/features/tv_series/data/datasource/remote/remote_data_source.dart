import 'package:dio/dio.dart';
import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

abstract class TvSeriesRemoteDataSource {
  Future<TvSeriesResponseModel> getAiringTodayTvSeries(int page);
  Future<TvSeriesResponseModel> getOnTheAirTvSeries(int page);
  Future<TvSeriesResponseModel> getPopularTvSeries(int page);
  Future<TvSeriesResponseModel> getTopRatedTvSeries(int page);
  Future<TvDetailsModel> getTvDetails(int id);
  Future<List<EpisodeModel>> getTvSeasonEpisodes(int id, int seasonNumber);
  Future<List<TvSeriesModel>> getSimilarTvSeries(int id);
}

class TvSeriesRemoteDataSourceImpl implements TvSeriesRemoteDataSource {
  final Dio dio;

  TvSeriesRemoteDataSourceImpl(this.dio);

  @override
  Future<TvSeriesResponseModel> getAiringTodayTvSeries(int page) async {
    final response = await dio.get(
      ApiConstants.airingTodayTVEP,
      queryParameters: {'page': page},
    );
    final tvSeriesResponse = TvSeriesResponseModel.fromJson(response.data);
    return tvSeriesResponse;
  }

  @override
  Future<TvSeriesResponseModel> getOnTheAirTvSeries(int page) async {
    final response = await dio.get(
      ApiConstants.onTheAirTVEP,
      queryParameters: {'page': page},
    );
    final tvSeriesResponse = TvSeriesResponseModel.fromJson(response.data);
    return tvSeriesResponse;
  }

  @override
  Future<TvSeriesResponseModel> getPopularTvSeries(int page) async {
    final response = await dio.get(
      ApiConstants.popularTVEP,
      queryParameters: {'page': page},
    );
    final tvSeriesResponse = TvSeriesResponseModel.fromJson(response.data);
    return tvSeriesResponse;
  }

  @override
  Future<TvSeriesResponseModel> getTopRatedTvSeries(int page) async {
    final response = await dio.get(
      ApiConstants.topRatedTVEP,
      queryParameters: {'page': page},
    );
    final tvSeriesResponse = TvSeriesResponseModel.fromJson(response.data);
    return tvSeriesResponse;
  }

  @override
  Future<TvDetailsModel> getTvDetails(int id) async {
    final response = await dio.get(ApiConstants.tvDetailsEP(id));
    return TvDetailsModel.fromJson(response.data);
  }

  @override
  Future<List<EpisodeModel>> getTvSeasonEpisodes(
      int id, int seasonNumber) async {
    final response =
        await dio.get(ApiConstants.seasonDetailsEP(id, seasonNumber));
    return (response.data['episodes'] as List)
        .map(
          (e) => EpisodeModel.fromJson(e),
        )
        .toList();
  }

  @override
  Future<List<TvSeriesModel>> getSimilarTvSeries(int id) async {
    final response = await dio.get(ApiConstants.similarTVEP(id));
    return (response.data['results'] as List)
        .map<TvSeriesModel>((e) => TvSeriesModel.fromJson(e))
        .toList();
  }
}
