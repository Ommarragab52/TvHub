import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class GetTvSeasonEpisodesUsecase {
  final TvSeriesRepository _tvSeriesRepository;
  GetTvSeasonEpisodesUsecase(this._tvSeriesRepository);
  Future<ApiResult> call(int id, int seasonNumber) async =>
      await _tvSeriesRepository.getTvSeasonEpisodes(id, seasonNumber);
}
