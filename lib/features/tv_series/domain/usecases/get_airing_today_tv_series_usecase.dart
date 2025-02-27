import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class GetAiringTodayTvSeriesUsecase {
  final TvSeriesRepository _tvSeriesRepository;
  GetAiringTodayTvSeriesUsecase(this._tvSeriesRepository);
  Future<ApiResult> call(int page) async =>
      await _tvSeriesRepository.getAiringTodayTvSeries(page);
}
