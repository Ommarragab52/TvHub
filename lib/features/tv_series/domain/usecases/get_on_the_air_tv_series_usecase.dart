import 'package:movies/core/index.dart';
import 'package:movies/features/tv_series/index.dart';

class GetOnTheAirTvSeriesUsecase {
  final TvSeriesRepository _tvSeriesRepository;
  GetOnTheAirTvSeriesUsecase(this._tvSeriesRepository);
  Future<ApiResult> call(int page) async =>
      await _tvSeriesRepository.getOnTheAirTvSeries(page);
}
