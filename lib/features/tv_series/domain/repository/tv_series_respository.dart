import 'package:movies/core/index.dart';

abstract class TvSeriesRepository {
  Future<ApiResult> getAiringTodayTvSeries(int page);
  Future<ApiResult> getOnTheAirTvSeries(int page);
  Future<ApiResult> getPopularTvSeries(int page);
  Future<ApiResult> getTopRatedTvSeries(int page);
  Future<ApiResult> getTvDetails(int id);
  Future<ApiResult> getTvSeasonEpisodes(int id, int seasonNumber);
  Future<ApiResult> getSimilarTvSeries(int id);
}
